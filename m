Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-iw0-f174.google.com ([209.85.214.174]:59276 "EHLO
	mail-iw0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754205Ab1DZRHC (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 26 Apr 2011 13:07:02 -0400
MIME-Version: 1.0
In-Reply-To: <BANLkTi=K3OEumicFMCT_Dh=xhpzfpa3JBw@mail.gmail.com>
References: <4DB4AEF7.3090607@verizon.net>
	<BANLkTi=K3OEumicFMCT_Dh=xhpzfpa3JBw@mail.gmail.com>
Date: Wed, 27 Apr 2011 01:07:01 +0800
Message-ID: <BANLkTikFUhiDSEM_yLtbzmhfdUWBDv71ww@mail.gmail.com>
Subject: Re: [PATCH] kbuild: mark unicore32 header export as broken
From: =?UTF-8?Q?Am=C3=A9rico_Wang?= <xiyou.wangcong@gmail.com>
Content-Type: text/plain; charset=UTF-8
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Arnaud Lacombe <lacombar@gmail.com>
Cc: pefoley2@verizon.net, linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, mmarek@suse.cz

On Tue, Apr 26, 2011 at 2:48 PM, Arnaud Lacombe <lacombar@gmail.com> wrote:
> Hi,
>
> On Sun, Apr 24, 2011 at 7:15 PM, Peter Foley <pefoley2@verizon.net> wrote:
>> This patch marks userspace header export for unicore32 as broken so that
>> it is skipped when running make headers_install_all.
>>
> Why ?
>
> I would expect you to send this to arch/unicore32 maintainer too, he
> is not in the CC: list.

+1

If you see errors when install kernel headers on unicore32, fix them instead
of marking it as broken.
