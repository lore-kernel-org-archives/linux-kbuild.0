Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mx2.suse.de ([195.135.220.15]:46390 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752579AbbLKJbv (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 11 Dec 2015 04:31:51 -0500
Subject: Re: Behaviour of kernel makefiles when entering a subdir using a
 config symbol = m
References: <56687204.4080404@ti.com> <20151209213255.GA11031@ravnborg.org>
 <56692D6D.6060607@ti.com> <20151210204638.GA32218@ravnborg.org>
From: Michal Marek <mmarek@suse.com>
Message-ID: <566A9804.6060305@suse.com>
Date: Fri, 11 Dec 2015 10:31:48 +0100
MIME-Version: 1.0
In-Reply-To: <20151210204638.GA32218@ravnborg.org>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Sam Ravnborg <sam@ravnborg.org>, Tomi Valkeinen <tomi.valkeinen@ti.com>
Cc: linux-kbuild@vger.kernel.org

Dne 10.12.2015 v 21:46 Sam Ravnborg napsal(a):
> On Thu, Dec 10, 2015 at 09:44:45AM +0200, Tomi Valkeinen wrote:
>> We have three drivers (one fbdev, two drm), each of which can be built
>> as a module. But each of them also may require small boot-time setup,
>> which needs to be built-in.
>>
>> I can get around the problem by entering the dir with obj-y, or by
>> creating a new extra config define which is y/n, and using that in the
>> makefile. The former makes make enter the dir even if the driver is not
>> enabled, and latter creates a config symbol only to solve this problem.
> The extra config symbol is the most elegant solution here IMO.
> Make sure to document that this config symbol enables the boot-time
> setup stuff.

Agreed. We could tech kbuild to look for built-in.o also in obj-m
subdirs, but I'm quite sure it would break a Makefile or two. We had
this case when adding support for modname-m recently, a couple of
Makefiles did not expect this and broke.

Michal

