classdef NoApiChatGPT < handle
    %NOAPICHATGPT Interact with ChatGPT-Inside to get answers to queries.
    %   chatGPT = NoApiChatGPT(systemPrompt) returns a NoApiChatGPT object
    %   where systemPrompt is the system prompt used to initialized
    %   ChatGPT. The system prompt can be left empty to use the default
    %   system prompt of ChatGPT Inside.
    %
    %
    %
    %   PLEASE NOTE THAT THIS IMPLEMENTATION IS ONLY FOR INTERNAL PURPOSES
    %   AND SHOULD NOT BE USED FOR PRODUCTION READY CODE. THE INTENTION OF
    %   NOAPICHATGPT IS TO ONLY PROMOTE THE USAGE OF AI FOR EXPLORATORY AND
    %   EDUCATIONAL PURPOSES.
    %
    %   THIS IS TEMPORARY CODE WHICH MAY STOP WORKING AT ANY POINT OF TIME
    %   DUE TO CHANGES IN CHATGPT-INSIDE'S HTML STRUCTURE.
    %
    %   Feel free to reach out to me if anything breaks and I can help in
    %   fixing it. Feel free to raise PR or issues on gitlab or contact me 
    %   (smylraj@mathworks.com) for any enhancements or issues.

    properties(Access=private)
        Webwindow       matlab.internal.webwindow
        Fixture         mwhtmlguitest.fixtures.WebWindowBrowserFixture
        Tester          mwhtmlguitest.webwindow.WindowTester

        NumMessages
    end

    % Constants to read from HTML
    properties(Access=private,Constant)
        InputPromptDialogPath = "/html/body/div/main/main/div/div[2]/div/div[2]/div[1]/div[2]/textarea";
        SystemPromptDialogPath = "/html/body/div/main/main/div/div[2]/div/div[1]/div/div/div/div[2]/div[1]/div[2]/textarea";
        RegenerateResponseBtnPath = "/html/body/div/main/main/div/div[2]/div/div[2]/div[1]/div[2]/button[2]";
        ChatBubblesCSS = ".prose";
        AnswerMagicNumber = 4;
    end

    methods
        function obj = NoApiChatGPT(systemPrompt)
            arguments
                systemPrompt string = string.empty();
            end

            obj.Webwindow = matlab.internal.webwindow("https://chatgpt-inside.mathworks.com/",matlab.internal.getDebugPort);
            obj.Fixture = mwhtmlguitest.fixtures.WebWindowBrowserFixture;
            obj.Fixture.setup();
            obj.Tester = obj.Fixture.createWindowTester(obj.Webwindow);

            obj.NumMessages = 0;

            if ~isempty(systemPrompt)
                obj.setSystemPrompt(systemPrompt);
            end
        end

        % This method asks ChatGPT a question and returns an answer.
        function answer = ask(obj,question,MaxTimeOutTime)
            arguments
                obj 
                question string {mustBeNonempty}
                MaxTimeOutTime (1,1) double = 60
            end
            
            inputPromptDialog = obj.getElementByXPath(obj.InputPromptDialogPath);

            inputPromptDialog.sendKey(question);
            inputPromptDialog.sendKey(mwhtmlguitest.NonTextKeys.ENTER);

            obj.NumMessages = obj.NumMessages + 1;

            MAXWAITTIME = MaxTimeOutTime;
            startTime = tic;

            while toc(startTime) < MAXWAITTIME
                if ~obj.isGenerating()
                    break;
                end
                pause(0.01);
            end

            if obj.isGenerating()
                error("Timeout. Reset ChatGPT");
            end

            chatBubblesEls = obj.Tester.getTestersByCSS(obj.ChatBubblesCSS);
            answer = chatBubblesEls{obj.NumMessages*obj.AnswerMagicNumber}.InnerText;
            
        end

        function delete(obj)
            obj.Webwindow.close();
        end
    end

    methods(Hidden)
        function show(obj)
            obj.Webwindow.maximize();
            obj.Webwindow.show();
        end

        function hide(obj)
            obj.Webwindow.hide();
        end
    end

    methods(Access=private)

        function setSystemPrompt(obj,systemPrompt)
            systemPromptDialog = obj.getElementByXPath(obj.SystemPromptDialogPath);

            systemPromptDialog.sendKey([mwhtmlguitest.NonTextKeys.CONTROL 'a']);
            systemPromptDialog.sendKey(systemPrompt);
        end
        
        function element = getElementByXPath(obj,xPath)
            try
                element = obj.Tester.getTesterByXPath(xPath);
            catch
                error("The underlying HTML of the webpage changed. Recalibrate XPATH constants.");
            end
        end

        % Check if ChatGPT is still generating the answer
        function tf = isGenerating(obj)
            try
                tf = obj.getElementByXPath(obj.RegenerateResponseBtnPath).InnerText ~= "Regenerate response";
            catch
                tf = true;
            end
        end
    end
end