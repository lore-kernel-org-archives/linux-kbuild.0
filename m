Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from nd215.dnsexit.com ([64.182.102.215]:60775 "EHLO
	box7.911domain.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
	with ESMTP id S1754811Ab1DZON6 (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 26 Apr 2011 10:13:58 -0400
Message-ID: <4DB6D2F7.4000908@verizon.net>
Date: Tue, 26 Apr 2011 10:13:11 -0400
From: Peter Foley <pefoley2@verizon.net>
Reply-To: <pefoley2@verizon.net>
MIME-Version: 1.0
Subject: Re: [PATCH] kbuild: scripts/kconfig/Makefile cleanup and fixes
References: <4DB60DE1.8060402@verizon.net> <BANLkTiniyJ6u-1X9DT74+2xHBKJDVc6bSA@mail.gmail.com>
In-Reply-To: <BANLkTiniyJ6u-1X9DT74+2xHBKJDVc6bSA@mail.gmail.com>
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Arnaud Lacombe <lacombar@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, mmarek@suse.cz

On 4/26/2011 2:38 AM, Arnaud Lacombe wrote:
> Hi,
> 
> On Mon, Apr 25, 2011 at 8:12 PM, Peter Foley <pefoley2@verizon.net> wrote:
>> This patch:
>> Changes the update-po-config target to work when make is run from KBUILD_OUTDIR.
>> Adds a check to only build kxgettext when needed.
>> Changes the qconf and gconf targets to change hostprogs-y when they are being built
>>        like nconfig and menuconfig instead of defining *-objs.
>> Cleans up the clean-files definitions.
>>
> Would it be possible to split that one into several patches, one for
> each change ? Associating the diff and to log is pretty much
> impossible. From the commit message, that should be 4 patches.
> 
> Thanks,
>  - Arnaud
> 

Ok, I'll do that.

Thanks,

Peter Foley
