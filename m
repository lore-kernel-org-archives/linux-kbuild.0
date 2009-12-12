Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:53133 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1761529AbZLLL1q (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Sat, 12 Dec 2009 06:27:46 -0500
Message-ID: <4B237E3C.2080603@suse.cz>
Date: Sat, 12 Dec 2009 12:27:56 +0100
From: Michal Marek <mmarek@suse.cz>
MIME-Version: 1.0
Subject: Re: [PATCH] wrap long help lines
References: <3b09bd800912110901t106bb3a6td581537e151d5ce0@mail.gmail.com>
In-Reply-To: <3b09bd800912110901t106bb3a6td581537e151d5ce0@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: =?UTF-8?B?IlZhZGltIEJlbmRlYnVyeSAo0LLQsSki?= <vbendeb@google.com>
Cc: linux-kbuild@vger.kernel.org

Vadim Bendebury (вб) napsal(a):
> Hi Michal, thank you for your comments. Please see my further questions below:
> 
> 2009/12/11 Michal Marek <mmarek@suse.cz>:
>> Vadim Bendebury napsal(a):
>>> Help text for certain config options is very extensive (the text includes all
>>> config options which the option in question depends on). Long lines are not
>>> wrapped, making it impossible to see the list.
>>>
>>> This patch adds a function to wrap long lines to fit the screen width and
>>> makes sure the function is invoked after help text is prepared.
>> Hi Vadim,
>>
>> I think that wrapping long lines in menuconfig is a good idea, but I
>> have a few problems with your patch.
>>
> 
> this was just an attempt to get the discussion going  :-)
> 
>>> diff --git a/scripts/kconfig/expr.c b/scripts/kconfig/expr.c
>>> index edd3f39..2aa49e8 100644
>>> --- a/scripts/kconfig/expr.c
>>> +++ b/scripts/kconfig/expr.c
>>> @@ -1083,6 +1083,8 @@ void expr_print(struct expr *e, void (*fn)(void *, struct symbol *, const char *
>>>       }
>>>       if (expr_compare_type(prevtoken, e->type) > 0)
>>>               fn(data, NULL, ")");
>>> +
>>> +     str_screen_wrap(data, "||");
>>>  }
>> expr_print() is not the right place to do it. data is a opaque pointer,
>> you can't assume that it's a pointer to struct gstr. qconf passes some
>> class pointer here, there is code to dump symbol info to a filehandle.
>> This should be done in the actual interface program, not in this generic
>> code.
>>
> 
> well, I picked this spot because this is where just the last line of
> the text might require wrapping, this makes the wrapping function
> simpler.
> 
> What do you think of mconf:show_help() before invoking
> show_help_text() - is it the right spot to plug this in? Do you have a
> suggestion?

If you look at the expr_print() prototype, it takes a pointer to a
callback and a data argument. This callback gets repeatedly called to
store or display parts of the text. So you could create a new callback
that pastes the parts together and inserts a newline if needed. That
way, you don't have to memcpy() the text around afterwards.


> And this brings the main question: how do we tell the window width in
> different modes? Do we care to do this wrap in other than text
> terminal modes?

Qt and Gtk use widgets that take care of proper wrapping. oldconfig just
prints the text on the terminal which does the wrapping (not at word
boundaries, but that's IMO not an issue). So it's really just menuconfig
(and nconfig, but porting your change to nconfig should be trivial).

Michal
