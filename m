Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-yw0-f182.google.com ([209.85.211.182]:58944 "EHLO
	mail-yw0-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752153Ab0ASRXh convert rfc822-to-8bit (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 19 Jan 2010 12:23:37 -0500
MIME-Version: 1.0
In-Reply-To: <20100119142545.GB3473@hack>
References: <1263883920-17289-1-git-send-email-vapier@gentoo.org>
	<20100119142545.GB3473@hack>
From: Mike Frysinger <vapier.adi@gmail.com>
Date: Tue, 19 Jan 2010 12:23:16 -0500
Message-ID: <8bd0f97a1001190923p6104acb4if5ec7225d549b713@mail.gmail.com>
Subject: Re: [PATCH] kconfig: dont hardcode path to lsmod
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: =?UTF-8?Q?Am=C3=A9rico_Wang?= <xiyou.wangcong@gmail.com>
Cc: Steven Rostedt <srostedt@redhat.com>, linux-kbuild@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, linux-kernel@vger.kernel.org

On Tue, Jan 19, 2010 at 09:25, Américo Wang wrote:
> On Tue, Jan 19, 2010 at 01:52:00AM -0500, Mike Frysinger wrote:
>>The lsmod utility has always been installed into /bin with the newer
>>module-init-tools package, so let lsmod be found via PATH instead of
>>hardcoding the old modutils /sbin path.
>>
>
> Some distro doesn't set /sbin to PATH, so for me a better solution
> would be making PATH contain /sbin, and then use "lsmod".

read my changelog -- module-init-tools has always installed into /bin.
 so what your distro does with /sbin doesnt matter.
-mike
