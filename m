Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-iy0-f174.google.com ([209.85.210.174]:49684 "EHLO
	mail-iy0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1758457Ab1EaJHp (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 31 May 2011 05:07:45 -0400
MIME-Version: 1.0
In-Reply-To: <1306767052-15593-3-git-send-email-mmarek@suse.cz>
References: <1306767052-15593-1-git-send-email-mmarek@suse.cz>
	<1306767052-15593-3-git-send-email-mmarek@suse.cz>
Date: Tue, 31 May 2011 17:07:45 +0800
Message-ID: <BANLkTinB96saeLFZPG88Rtjq30gioj8hRw@mail.gmail.com>
Subject: Re: [PATCH 2/4] kbuild: Fix <linux/version.h> for X.Y versions
From: =?UTF-8?Q?Am=C3=A9rico_Wang?= <xiyou.wangcong@gmail.com>
Content-Type: text/plain; charset=UTF-8
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Marek <mmarek@suse.cz>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org

On Mon, May 30, 2011 at 10:50 PM, Michal Marek <mmarek@suse.cz> wrote:
> expr treats all numbers as decimals, so prepending a zero is safe. Note
> that the KERNEL_VERSION() macro still takes three arguments, 3.0 has to be
> written as KERNEL_VERSION(3,0,0).
>
> Signed-off-by: Michal Marek <mmarek@suse.cz>

Acked-by: WANG Cong <xiyou.wangcong@gmail.com>

Thanks.
