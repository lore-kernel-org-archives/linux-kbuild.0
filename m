Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:42656 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1755130Ab0ITMDz (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 20 Sep 2010 08:03:55 -0400
Message-ID: <4C974DA8.5020207@suse.cz>
Date: Mon, 20 Sep 2010 14:03:52 +0200
From: Michal Marek <mmarek@suse.cz>
MIME-Version: 1.0
Subject: Re: [PATCH] kconfig qconf: port to QT4
References: <201008011032.09611.edt@aei.ca> <1280690915-16380-1-git-send-email-alexander.stein@informatik.tu-chemnitz.de> <201008020801.24130.edt@aei.ca> <201009181022.31547.edt@aei.ca>
In-Reply-To: <201009181022.31547.edt@aei.ca>
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Ed Tomlinson <edt@aei.ca>
Cc: Alexander Stein <alexander.stein@informatik.tu-chemnitz.de>, linux-kbuild@vger.kernel.org, Roman Zippel <zippel@linux-m68k.org>, lkml <linux-kernel@vger.kernel.org>

On 18.9.2010 16:22, Ed Tomlinson wrote:
> On Monday 02 August 2010 08:01:23 Ed Tomlinson wrote:
>> Hi,
>>
>> Works as advertised here.  The merge window for .36 is open.  Would it be possible for this to be included?
> 
> Looks like this did not make it into .36...  would you have a version that works with .36-rc

It is in the kconfig branch of
git://git.kernel.org/pub/scm/linux/kernel/git/mmarek/kbuild-2.6.git and
will end up in 2.6.37-rc1.

Michal
