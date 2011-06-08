Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:45225 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752411Ab1FHUcm (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 8 Jun 2011 16:32:42 -0400
Message-ID: <4DEFDCBB.9090400@suse.cz>
Date: Wed, 08 Jun 2011 22:34:03 +0200
From: Michal Marek <mmarek@suse.cz>
MIME-Version: 1.0
Subject: Re: [RFCv5] Kbuild: factor parser rules
References: <1307479931-10424-1-git-send-email-lacombar@gmail.com>	<1307509408-2497-1-git-send-email-lacombar@gmail.com>	<20110608153843.GB4612@sepie.suse.cz> <BANLkTingPzEZXbBim4-BmsvZb8SkG++vEw@mail.gmail.com>
In-Reply-To: <BANLkTingPzEZXbBim4-BmsvZb8SkG++vEw@mail.gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Arnaud Lacombe <lacombar@gmail.com>
Cc: linux-kbuild@vger.kernel.org

Dne 8.6.2011 18:11, Arnaud Lacombe napsal(a):
> Hi,
> 
> On Wed, Jun 8, 2011 at 11:38 AM, Michal Marek <mmarek@suse.cz> wrote:
>> On Wed, Jun 08, 2011 at 01:03:28AM -0400, Arnaud Lacombe wrote:
>>> Hi Michal,
>>>
>>> Here is some update concerning the parser generation merge. I do not repost the
>>> whole serie as it may be overkill. You can find the latest branch at:
>>>
>>> git://github.com/lacombar/linux-2.6.git kbuild-implicit-parser-rule
>>>
>>> So let't get it done the safe way...
>>>
>>> Changes since v4:
>>> [...]
>>
>>
>> Hi, I found now what my problem with genksyms was. I use O= and you
>> removed the -I$(src) for the lexer (which is a generated file, but needs
>> genksyms.h from the source directory). With the following patch,
>> everything should work again (test builds still running, but they built
>> genksyms already):
>>
> yes, I spotted that yesterday, this is fixed in v5.

Then please push it to github :)

$ git ls-remote git://github.com/lacombar/linux-2.6.git | grep
kbuild-implicit-parser-rule
a483784894fcbba51be58afc4a2ff1373ed96ca0
refs/heads/kbuild-implicit-parser-rule
$ git show
a483784894fcbba51be58afc4a2ff1373ed96ca0:scripts/genksyms/Makefile |
grep FLAGS
HOSTCFLAGS_parse.tab.o := -Wno-uninitialized -I$(src)
$

Michal
