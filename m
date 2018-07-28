Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-03.nifty.com ([210.131.2.82]:31554 "EHLO
        conssluserg-03.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725835AbeG1HHR (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 28 Jul 2018 03:07:17 -0400
MIME-Version: 1.0
In-Reply-To: <fd435ffe-5323-6c71-8945-b3b22ee80e84@redhat.com>
References: <20180720193528.1341-1-jcline@redhat.com> <CAK7LNAQWotaFhMAnW=Ah8aFO8VMxUB4bXursTe6JTZxcTzettQ@mail.gmail.com>
 <fd435ffe-5323-6c71-8945-b3b22ee80e84@redhat.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Sat, 28 Jul 2018 14:41:17 +0900
Message-ID: <CAK7LNASW2y5Q-hu5uCK6te0J+=bGtC6OG98EbBiREA7UFwSZqQ@mail.gmail.com>
Subject: Re: [PATCH] scripts: Add Python 3 support to tracing/draw_functrace.py
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Jeremy Cline <jcline@redhat.com>
Cc: Michal Marek <michal.lkml@markovi.net>, Frederic Weisbecker <fweisbec@gmail.com>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

2018-07-26 0:01 GMT+09:00 Jeremy Cline <jcline@redhat.com>:
> On 07/25/2018 10:39 AM, Masahiro Yamada wrote:
>> 2018-07-21 4:35 GMT+09:00 Jeremy Cline <jcline@redhat.com>:
>>> Use the print function. This maintains Python 2 support and should have
>>> no functional change.
>>>
>>> Signed-off-by: Jeremy Cline <jcline@redhat.com>
>>> ---
>>>  scripts/tracing/draw_functrace.py | 3 ++-
>>>  1 file changed, 2 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/scripts/tracing/draw_functrace.py b/scripts/tracing/draw_functrace.py
>>> index db40fa04cd51..7d44e796d362 100755
>>> --- a/scripts/tracing/draw_functrace.py
>>> +++ b/scripts/tracing/draw_functrace.py
>>> @@ -20,6 +20,7 @@ Usage:
>>>         $ scripts/draw_functrace.py < raw_trace_func > draw_functrace
>>>         Then you have your drawn trace in draw_functrace
>>>  """
>>> +from __future__ import print_function
>>
>> What do you need this line for?
>>
>> I have not tested this,
>> but I guess print(CallTree.ROOT) will work for Python 2.
>
> Although "print(CallTree.ROOT)" (as a statement) works in Python 2,
> its behavior is different than print (as a function) in Python 3. In
> this case, there's no additional arguments being provided so the
> behavior will match, but if someone added an argument it would work
> differently on Python 2 vs Python 3:
>
> Python 2.7.15
>>>> print("hello", "world")
> ('hello', 'world')
>
> Python 3.6.6
>>>> print("hello, "world")
>   File "<stdin>", line 1
>     print("hello, "world")
>                        ^
> SyntaxError: invalid syntax

Yes, I know this.


> Importing the print_function works on Python 2.6+[0] and changes print
> to be a function in Python 2 so it'll behave the same in 2 and 3. Given
> that this script doesn't appear to change much it's probably not going
> to save anyone from making that mistake, though. Would you prefer a
> patch without it?

Either will do.
If it is tedious to respin, I will pick this up.


I saw only one simple print statement in this script,
so I wanted to ask you if this had some reason
I might be missing.

Anyway, we will remove 'from __future__ import print_function'
when Python 2 retires.



> [0] https://docs.python.org/3/library/__future__.html
>
> Regards,
> Jeremy
>
>>
>>
>>
>>>
>>>  import sys, re
>>> @@ -123,7 +124,7 @@ def main():
>>>                 tree = tree.getParent(caller)
>>>                 tree = tree.calls(callee, calltime)
>>>
>>> -       print CallTree.ROOT
>>> +       print(CallTree.ROOT)
>>>
>>>  if __name__ == "__main__":
>>>         main()
>>> --
>>> 2.17.1
>>>
>>
>>
>>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-kbuild" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html



-- 
Best Regards
Masahiro Yamada
