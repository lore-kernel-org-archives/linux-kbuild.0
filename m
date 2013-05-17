Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-wi0-f171.google.com ([209.85.212.171]:48161 "EHLO
	mail-wi0-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751449Ab3EQJMe (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 17 May 2013 05:12:34 -0400
Received: by mail-wi0-f171.google.com with SMTP id hq7so283357wib.4
        for <linux-kbuild@vger.kernel.org>; Fri, 17 May 2013 02:12:33 -0700 (PDT)
Message-ID: <5195F47E.7090903@6wind.com>
Date: Fri, 17 May 2013 11:12:30 +0200
From: Nicolas Dichtel <nicolas.dichtel@6wind.com>
Reply-To: nicolas.dichtel@6wind.com
MIME-Version: 1.0
Subject: Re: [PATCH linux-next v2] fix make headers_install when path is too
 long
References: <20130426185709.GA13399@merkur.ravnborg.org> <1367237751-24962-1-git-send-email-nicolas.dichtel@6wind.com> <517E68BE.2060303@windriver.com> <518767AE.2070005@6wind.com>
In-Reply-To: <518767AE.2070005@6wind.com>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: mmarek@suse.cz
Cc: Bruce Ashfield <bruce.ashfield@windriver.com>, sam@ravnborg.org, linux-kbuild@vger.kernel.org

Le 06/05/2013 10:19, Nicolas Dichtel a écrit :
> Le 29/04/2013 14:34, Bruce Ashfield a écrit :
>> On 13-04-29 08:15 AM, Nicolas Dichtel wrote:
>>> If headers_install is executed from a deep/long directory structure, the
>>> shell's maximum argument length can be execeeded, which breaks the operation
>>> with:
>>>
>>> | make[2]: execvp: /bin/sh: Argument list too long
>>> | make[2]: ***
>>>
>>> Instead of passing each files name with the entire path, I give only the file
>>> name without the source path and give this path as a new argument to
>>> headers_install.pl.
>>>
>>> Because there is three possible paths, I have tree input-files list, one per
>>> path.
>>
>> This version still works for my test case.
>>
>> Tested-by: Bruce Ashfield <bruce.ashfield@windriver.com>
>>
>>>
>>> Signed-off-by: Nicolas Dichtel <nicolas.dichtel@6wind.com>
>>> ---
> Should I do something more for this patch? It seems not included.
ping
