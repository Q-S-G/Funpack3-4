try
    % 尝试创建TCP客户端对象
    t = tcpclient('192.168.0.102', 5001, 'ConnectTimeout', 1);
catch ME
    % 如果连接失败，捕获异常并打印自定义字符串
    fprintf('连接失败\n');
    return; % 退出函数或脚本
end

% 发送数据
data1 = "temp";
writeline(t, data1);

% 持续读取TCP服务器发来的信息
while true
    try
        if t.NumBytesAvailable > 0
            % 读取数据
            receivedData = readline(t);
            fprintf('收到数据: %s\n', receivedData);
        end
        pause(0.1); % 短暂暂停，避免循环过快
    catch ME
        % 捕获异常并处理
        fprintf('读取数据时发生异常: %s\n', ME.message);
        break; % 退出循环
    end
end

% 关闭连接
clear t;