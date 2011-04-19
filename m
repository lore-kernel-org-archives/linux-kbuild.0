Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-ww0-f44.google.com ([74.125.82.44]:48313 "EHLO
	mail-ww0-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752384Ab1DSSXW (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 19 Apr 2011 14:23:22 -0400
Received: by wwa36 with SMTP id 36so7282834wwa.1
        for <linux-kbuild@vger.kernel.org>; Tue, 19 Apr 2011 11:23:21 -0700 (PDT)
Message-ID: <4DADD316.9020000@gmail.com>
Date: Tue, 19 Apr 2011 19:23:18 +0100
From: Marcin Nowakowski <marcin.nowakowski.000@gmail.com>
MIME-Version: 1.0
Subject: Re: [kbuild patch] mkcompile_h produces warnings when using domain
 logins
References: <4D9B63B2.1080701@gmail.com> <4DAD47B4.3080908@suse.cz>
In-Reply-To: <4DAD47B4.3080908@suse.cz>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Marek <mmarek@suse.cz>
Cc: linux-kbuild@vger.kernel.org

On 19/04/11 09:28, Michal Marek wrote:
> (CC linux-kbuild, please do not send patches to public projects privately)
>
> On 5.4.2011 20:47, Marcin Nowakowski wrote:
>> Fix handling of backslash character in LINUX_COMPILE_BY name
>>
>> When using a domain login, `whoami` returns the login in
>> user\domain format. This leads to either warnings on unrecognised
>> escape sequences or escaped characters being generated for the user.
>> This patch ensures that any backslash is escaped to a double-backslash
>> to make sure the name is preserved correctly
>>
>> Signed-off-by: Marcin Nowakowski<marcin.nowakowski.000@gmail.com>
>> --- a/scripts/mkcompile_h
>> +++ b/scripts/mkcompile_h
>> @@ -64,7 +64,7 @@
>>      echo \#define UTS_VERSION \"`echo $UTS_VERSION | $UTS_TRUNCATE`\"
>>
>>      echo \#define LINUX_COMPILE_TIME \"`date +%T`\"
>> -  echo \#define LINUX_COMPILE_BY \"`whoami`\"
>> +  echo \#define LINUX_COMPILE_BY \"`whoami | sed
>> "s/\\\\\\\\/\\\\\\\\\\\\\\\\/"`\"
>>      echo \#define LINUX_COMPILE_HOST \"`hostname | $UTS_TRUNCATE`\"
>
> Such long sequence of backslashes is rather unreadable. The same command
> is equivalent to
>
>    sed 's/\\\\/\\\\\\\\/'
>
> if you use single quotes, but I wonder why you need to match two
> backslashes. You say that whoami returns 'user\domain', so the above
> regexp wouldn't match it.

The problem in this case is that when using back-quotes for command 
substitution, backslashes are escaped so we need the extra layer of 
escaping. However - having looked again at the bash documentation, I've 
found that if $(...) syntax is used instead of `...` then backslashes 
are treated literally. That, with addition of single quotes as you had 
suggested should allow a simple
echo \#define LINUX_COMPILE_BY \"$(whoami | sed 's/\\/\\\\/g')\"
instead of the rather unreadable solution I initially suggested.

> Also, is it necessary to reproduce the full
> user\domain string in the macro? Or could we cut everything after the
> backslash, like
>
>    sed  's/\\.*//'
>
> ? BTW, I changed the mkcompile_h script recently, see
> http://git.kernel.org/?p=linux/kernel/git/mmarek/kbuild-2.6.git;a=blob;f=scripts/mkcompile_h;hb=refs/heads/for-next,
> could you base any further version on the for-next branch of
> kbuild.2.6.git or on linux-next?

I'll re-send a new patched based on this tree and with the cleanup as 
described above

thanks
Marcin
