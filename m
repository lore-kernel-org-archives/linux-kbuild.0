Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-iy0-f174.google.com ([209.85.210.174]:53492 "EHLO
	mail-iy0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750883Ab1EWFsP convert rfc822-to-8bit (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 23 May 2011 01:48:15 -0400
Received: by iyb14 with SMTP id 14so4378626iyb.19
        for <linux-kbuild@vger.kernel.org>; Sun, 22 May 2011 22:48:15 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <BANLkTikEVvaPU4C-qjG7erXnEPbbTKGwuA@mail.gmail.com>
References: <1304561004-2684-1-git-send-email-lacombar@gmail.com>
	<1304561004-2684-2-git-send-email-lacombar@gmail.com>
	<20110505141833.GF13293@sepie.suse.cz>
	<BANLkTikEVvaPU4C-qjG7erXnEPbbTKGwuA@mail.gmail.com>
Date: Mon, 23 May 2011 01:48:14 -0400
Message-ID: <BANLkTim-tzbC5CrAzjq2bf-BGBU9KH6pVQ@mail.gmail.com>
Subject: Re: [RFC 1/9] genksyms: rename parser files
From: Arnaud Lacombe <lacombar@gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8BIT
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Marek <mmarek@suse.cz>
Cc: linux-kbuild@vger.kernel.org

Hi,

On Sun, May 22, 2011 at 10:06 PM, Arnaud Lacombe <lacombar@gmail.com> wrote:
> Hi,
>
> On Thu, May 5, 2011 at 10:18 AM, Michal Marek <mmarek@suse.cz> wrote:
>> On Wed, May 04, 2011 at 10:03:16PM -0400, Arnaud Lacombe wrote:
>>> Rename parser's files to make them follow the same convention as `kconfig'.
>>
>> This mail didn't reach the mailing list, probably for size reasons. I
>> suggest you create the patch with the -M option, it will be a bit harder to
>> apply, but people will be able to see it.
>>
> yup, will do.
>
>>>  scripts/genksyms/lex.c_shipped           | 2709 ------------------------------
>>>  scripts/genksyms/lex.genksyms.c_shipped  | 2709 ++++++++++++++++++++++++++++++
>>>  scripts/genksyms/lex.l                   |  409 -----
>>>  scripts/genksyms/parse.c_shipped         | 2353 --------------------------
>>>  scripts/genksyms/parse.h_shipped         |  139 --
>>>  scripts/genksyms/parse.y                 |  473 ------
>>
>> Renaming lex.l is a good idea, lex.lex.c would look silly. But I would
>> leave parse.y and keywords.gperf and only rename the _shipped files to
>> match what the new rules do. The names are local to the directory, so
>> there is no urgent need to change them
>> (and the history is easier to view if there are fewer renames).
>>
actually, renaming both the parser and the lexer would have been
needed if we want to keep using the -p option for bison and -P option
for flex, ie. using zconfparse() instead of yyparse(). The rationale
being that the rules use the filename to derive the prefix. Without
rename, we end up with very silly function name ala "lexlex()" or
"parseparse()". For now, I will just drop those two options, kconfig
will need to be fix to reflect this.

Unfortunately, there do not seem to be a less non-intrusive solution.
If renaming, kconfig is fine, genksyms needs fixes; if not renaming,
kconfig needs fixes, genksyms is fine...

 - Arnaud
