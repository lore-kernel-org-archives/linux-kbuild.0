Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:47913 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1755255Ab3EQUIg (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 17 May 2013 16:08:36 -0400
Date: Fri, 17 May 2013 22:08:33 +0200
From: Michal Marek <mmarek@suse.cz>
Subject: Re: [PATCH linux-next v2] fix make headers_install when path is
	too long
Message-ID: <20130517200833.GA32377@pobox.suse.cz>
References: <20130426185709.GA13399@merkur.ravnborg.org> <1367237751-24962-1-git-send-email-nicolas.dichtel@6wind.com> <517E68BE.2060303@windriver.com> <518767AE.2070005@6wind.com> <5195F47E.7090903@6wind.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5195F47E.7090903@6wind.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Nicolas Dichtel <nicolas.dichtel@6wind.com>
Cc: Bruce Ashfield <bruce.ashfield@windriver.com>, sam@ravnborg.org, linux-kbuild@vger.kernel.org

On Fri, May 17, 2013 at 11:12:30AM +0200, Nicolas Dichtel wrote:
> Le 06/05/2013 10:19, Nicolas Dichtel a écrit :
>> Le 29/04/2013 14:34, Bruce Ashfield a écrit :
>>> On 13-04-29 08:15 AM, Nicolas Dichtel wrote:
>>>> If headers_install is executed from a deep/long directory structure, the
>>>> shell's maximum argument length can be execeeded, which breaks the operation
>>>> with:
>>>>
>>>> | make[2]: execvp: /bin/sh: Argument list too long
>>>> | make[2]: ***
>>>>
>>>> Instead of passing each files name with the entire path, I give only the file
>>>> name without the source path and give this path as a new argument to
>>>> headers_install.pl.
>>>>
>>>> Because there is three possible paths, I have tree input-files list, one per
>>>> path.
>>>
>>> This version still works for my test case.
>>>
>>> Tested-by: Bruce Ashfield <bruce.ashfield@windriver.com>
>>>
>>>>
>>>> Signed-off-by: Nicolas Dichtel <nicolas.dichtel@6wind.com>
>>>> ---
>> Should I do something more for this patch? It seems not included.
> ping

I applied the patch to kbuild.git#kbuild now.

Michal
