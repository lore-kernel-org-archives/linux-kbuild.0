Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:49186 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S934069Ab1D2XAM (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 29 Apr 2011 19:00:12 -0400
Message-ID: <4DBB42F9.7070407@suse.cz>
Date: Sat, 30 Apr 2011 01:00:09 +0200
From: Michal Marek <mmarek@suse.cz>
MIME-Version: 1.0
Subject: Re: [PATCH V2 0/7] kbuild: move scripts/basic/docproc.c to scripts/docproc.c
References: <4DBB3DD4.9000000@verizon.net> <20110429154649.848f9ba8.rdunlap@xenotime.net>
In-Reply-To: <20110429154649.848f9ba8.rdunlap@xenotime.net>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Randy Dunlap <rdunlap@xenotime.net>
Cc: pefoley2@verizon.net, linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org

On 30.4.2011 00:46, Randy Dunlap wrote:
> On Fri, 29 Apr 2011 18:38:12 -0400 Peter Foley wrote:
> 
>> This patchset moves scripts/basic/docproc to scripts/docproc.
>> This causes docproc to only be built for *doc targets rather than every
>> time the kernel is compiled.
>>
>> Patches also attached as requested by Michal Marek.
> 
> 
> That's disappointing (the attachments).  Why was this requested?
> 
> See Documentation/CodingStyle, section 7:
> 
> "No MIME, no links, no compression, no attachments.  Just plain text."

and a couple of lines later:
"Exception:  If your mailer is mangling patches then someone may ask
you to re-send them using MIME."

Which is exactly what happened here - the patches had missing or excess
leading space and in some cases a context line was missing. So instead
of manually reconstructing the patches, I asked Peter to resend them as
attachments.

BUT - I didn't request to split this patch into seven pieces. Splitting
patches into smaller parts is desired, but each part has to be self
contained and not break stuff when the later parts are not applied. So
when moving a .c file, then the corespoding Makefile changes need to be
contained in the same patch. No need to resend the patch now, I'll fold
the patches into one again, but please consider this next time.

> Instead, the saved file contains lines like
> this (below) and each patch 2 times (inline and attachment).

Yeah, only sending the attachment would be better in this case.

Michal
