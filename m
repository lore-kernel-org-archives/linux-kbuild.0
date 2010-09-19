Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-wy0-f174.google.com ([74.125.82.174]:49926 "EHLO
	mail-wy0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752869Ab0ISOxS convert rfc822-to-8bit (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Sun, 19 Sep 2010 10:53:18 -0400
Received: by wyf22 with SMTP id 22so3606814wyf.19
        for <linux-kbuild@vger.kernel.org>; Sun, 19 Sep 2010 07:53:17 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20100919094244.GA25704@merkur.ravnborg.org>
References: <1284220282-3500-1-git-send-email-lacombar@gmail.com>
	<1284220282-3500-7-git-send-email-lacombar@gmail.com>
	<20100919094244.GA25704@merkur.ravnborg.org>
Date: Sun, 19 Sep 2010 10:53:17 -0400
Message-ID: <AANLkTi=bO7WT1g=RrGbEW35asjus3cQapoUv64e=Ugxr@mail.gmail.com>
Subject: Re: [PATCH 06/15] kconfig: implement the `mainmenu' directive
From: Arnaud Lacombe <lacombar@gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8BIT
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Sam Ravnborg <sam@ravnborg.org>
Cc: Michal Marek <mmarek@suse.cz>, linux-kbuild <linux-kbuild@vger.kernel.org>

Hi,

On Sun, Sep 19, 2010 at 5:42 AM, Sam Ravnborg <sam@ravnborg.org> wrote:
> On Sat, Sep 11, 2010 at 11:51:13AM -0400, Arnaud Lacombe wrote:
>> [...]
>>  %%
>> -input: stmt_list;
>> +input: nl start | start;
>> +
>> +start: mainmenu_stmt stmt_list | stmt_list;
>>
>
> With the above the mainmenu is mandatory.
> So there is no longer a need to explicit give it a promt as
> is done in conf_parse:
>
>        modules_sym->flags |= SYMBOL_AUTO;
>        rootmenu.prompt = menu_add_prompt(P_MENU, "Linux Kernel Configuration", NULL);
>
>
> And if we delete this (now not needed) assignment, we no longer requre
> the patch that silence warning about redefinition of rootmeny prompt.
>
No, it is not mandatory. My first implementation made it mandatory,
but I loosen the requirement after you asked me that it would be nice
not to have it mandatory for simple Kconfig file. Making it that way
also save some trouble on UML, but I'll come back on that later on.

 - Arnaud
