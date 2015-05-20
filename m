Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:39689 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751305AbbETFKR (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 20 May 2015 01:10:17 -0400
Message-ID: <555C172F.3020708@suse.cz>
Date: Wed, 20 May 2015 13:10:07 +0800
From: Michal Marek <mmarek@suse.cz>
MIME-Version: 1.0
Subject: Re: [PATCHv4 1/1] deb-pkg: Add device tree blobs to the package
References: <20150203121648.046396044@rtp-net.org> <20150422155535.GC32026@gluino>
In-Reply-To: <20150422155535.GC32026@gluino>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: maximilian attems <max@stro.at>, Arnaud Patard <arnaud.patard@rtp-net.org>
Cc: linux-kbuild@vger.kernel.org, Ben Hutchings <ben@decadent.org.uk>

Dne 22.4.2015 v 23:55 maximilian attems napsal(a):
> On Tue, Feb 03, 2015 at 01:16:33PM +0100, Arnaud Patard wrote:
>> When building a package with make deb-pkg (say, for arm), the dtb files are
>> not added to the package. Given that things are still evolving on arm, it
>> make sense to have them along with the kernel and modules.
>>
>> v4: Use $KCONFIG_CONFIG
>> v3: handle with OF but without dtbs_install.
>>     Use $MAKE ... as done everywhere else in the script
>> v2: make use of dtbs_install
>>
>> Signed-off-by: Arnaud Patard <arnaud.patard@rtp-net.org>
>> ---
> 
> the patch seems to apply to current linus with 
> Hunk #1 succeeded at 143 with fuzz 1.
> 
> acked.

Applied to kbuild.git#misc now, sorry for the delay.

Michal

