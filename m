Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-iw0-f174.google.com ([209.85.214.174]:49189 "EHLO
	mail-iw0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753270Ab0IYCwU (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 24 Sep 2010 22:52:20 -0400
MIME-Version: 1.0
In-Reply-To: <e0bdab5d2e8c52041c003de68ba774c3e706716c.1285355033.git.mfm@muteddisk.com>
References: <e0bdab5d2e8c52041c003de68ba774c3e706716c.1285355033.git.mfm@muteddisk.com>
Date: Sat, 25 Sep 2010 10:52:20 +0800
Message-ID: <AANLkTinDVs46mn1apGUy2ALauzO+f5sOhKhWr8MGk8=n@mail.gmail.com>
Subject: Re: [PATCH 01/24] base: change to new flag variable
From: =?UTF-8?Q?Am=C3=A9rico_Wang?= <xiyou.wangcong@gmail.com>
Content-Type: text/plain; charset=UTF-8
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: matt mooney <mfm@muteddisk.com>
Cc: kernel-janitors@vger.kernel.org, Greg Kroah-Hartman <gregkh@suse.de>, linux-kernel@vger.kernel.org, linux-kbuild <linux-kbuild@vger.kernel.org>, Michal Marek <mmarek@suse.cz>

On Sat, Sep 25, 2010 at 3:17 AM, matt mooney <mfm@muteddisk.com> wrote:
> Replace EXTRA_CFLAGS with ccflags-y.
>
> Signed-off-by: matt mooney <mfm@muteddisk.com>

Nice work, matt!

The whole patch set looks good for me:

Acked-by: WANG Cong <xiyou.wangcong@gmail.com>

Just please do remember to Cc linux-kbuild and Michal next time.

Thanks!
