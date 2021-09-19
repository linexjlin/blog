
## 相关参数
../freeswitch/conf/dialplan/default.xml
<action application="log" data="======record test====="/>

<action application="record_session" data="$${base_dir}/recordings/archive/${strftime(%Y-%m-%d-%H-%M-%S)}_${destination_number}_${caller_id_number}.wav"/>

<action application="log" data="======record test====="/>
//最小录音时间，这里是1秒，一般3秒以上录音才有意义
<action application="set" data="RECORD_MIN_SEC=2"/>
Continue Recording on Transfer
//是否接通后才进行录音    
<action application="set" data="media_bug_answer_req=true"/>
//只录"读" 方向的录音， 是指FreeSWITCH听到的声音
<action application="set" data="RECORD_READ_ONLY=true"/> 
<action application="set" data="recording_follow_transfer=true"/>
<action application="record_session" data="/tmp/${strftime(%Y-%m-%d-%H-%M-%S)}_${destination_number}_${caller_id_number}"/>

## 实际使用
<action application="log" data="======record test====="/>
<action application="set" data="RECORD_MIN_SEC=2"/>
<action application="set" data="media_bug_answer_req=true"/>
<action application="set" data="RECORD_READ_ONLY=true"/> 
<action application="set" data="recording_follow_transfer=true"/>
<action application="record_session" data="/tmp/${strftime(%Y-%m-%d-%H-%M-%S)}_${destination_number}_${caller_id_number}"/>


refer:
https://freeswitch.org/confluence/display/FREESWITCH/mod_dptools%3A+record_session
http://www.sevenmu.cn/articles/2019/12/27/1577435308772.html