Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:38361 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751279Ab2E1JXf (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 28 May 2012 05:23:35 -0400
Message-ID: <4FC34411.1070807@suse.cz>
Date: Mon, 28 May 2012 11:23:29 +0200
From: Michal Marek <mmarek@suse.cz>
MIME-Version: 1.0
Subject: Re: [PATCH] scripts/package/builddeb: include generated header files
References: <4FC0F29C.9050508@afaics.de> <20120526210005.GB32523@sepie.suse.cz> <4FC15323.1070206@afaics.de>
In-Reply-To: <4FC15323.1070206@afaics.de>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Harald Dunkel <harri@afaics.de>
Cc: linux-kbuild@vger.kernel.org

On 27.5.2012 00:03, Harald Dunkel wrote:
>> You make easier for the receiving party if you send patches using
>> git send-email. And lkml should be always CCed in addition to the
>> maintainer and/or subsystem mailing list. Otherwise, the patch
>> itself was OK.
>> 
> 
> I tried to follow the doc on kernelnewbies, but I haven't seen the
> git command line. It would help very much if you could send me a
> pointer to some more up-to-date information, if you have it at hand.

The commandline is

git send-email --to=... --cc=... --cc=... ... <base>
or
git send-email --to=... --cc=... --cc=... ... <base>..<end>

<base> is the commit you based your changes on. So you usually do

git checkout -b my-fix master
<hack hack hack>
git send-email ... master..my-fix

Then the receiver can simply pipe the email(s) to 'git am' to apply the
changes. Of course git send-email is not mandatory, but if you use it,
you can be sure that the patch will be applicable without further
processing.

Michal
