Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-iw0-f174.google.com ([209.85.214.174]:53739 "EHLO
	mail-iw0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753935Ab1EWCGs convert rfc822-to-8bit (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Sun, 22 May 2011 22:06:48 -0400
Received: by iwn34 with SMTP id 34so4366129iwn.19
        for <linux-kbuild@vger.kernel.org>; Sun, 22 May 2011 19:06:47 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20110505141833.GF13293@sepie.suse.cz>
References: <1304561004-2684-1-git-send-email-lacombar@gmail.com>
	<1304561004-2684-2-git-send-email-lacombar@gmail.com>
	<20110505141833.GF13293@sepie.suse.cz>
Date: Sun, 22 May 2011 22:06:47 -0400
Message-ID: <BANLkTikEVvaPU4C-qjG7erXnEPbbTKGwuA@mail.gmail.com>
Subject: Re: [RFC 1/9] genksyms: rename parser files
From: Arnaud Lacombe <lacombar@gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8BIT
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Marek <mmarek@suse.cz>
Cc: linux-kbuild@vger.kernel.org

Hi,

On Thu, May 5, 2011 at 10:18 AM, Michal Marek <mmarek@suse.cz> wrote:
> On Wed, May 04, 2011 at 10:03:16PM -0400, Arnaud Lacombe wrote:
>> Rename parser's files to make them follow the same convention as `kconfig'.
>
> This mail didn't reach the mailing list, probably for size reasons. I
> suggest you create the patch with the -M option, it will be a bit harder to
> apply, but people will be able to see it.
>
yup, will do.

>>  scripts/genksyms/lex.c_shipped           | 2709 ------------------------------
>>  scripts/genksyms/lex.genksyms.c_shipped  | 2709 ++++++++++++++++++++++++++++++
>>  scripts/genksyms/lex.l                   |  409 -----
>>  scripts/genksyms/parse.c_shipped         | 2353 --------------------------
>>  scripts/genksyms/parse.h_shipped         |  139 --
>>  scripts/genksyms/parse.y                 |  473 ------
>
> Renaming lex.l is a good idea, lex.lex.c would look silly. But I would
> leave parse.y and keywords.gperf and only rename the _shipped files to
> match what the new rules do. The names are local to the directory, so
> there is no urgent need to change them
> (and the history is easier to view if there are fewer renames).
>
@$!# ... git-blame and git-log do not behave the same on renamed
file... That is, when ran on a renamed file, git-blame will show the
old blame, totally unaffected, while git-log will only display the
history of the new name. Of course, I only checked git-blame :)

 - Arnaud
