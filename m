Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from nf-out-0910.google.com ([64.233.182.189]:61069 "EHLO
	nf-out-0910.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751541AbYB0DKF (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 26 Feb 2008 22:10:05 -0500
Received: by nf-out-0910.google.com with SMTP id g13so1326253nfb.21
        for <linux-kbuild@vger.kernel.org>; Tue, 26 Feb 2008 19:10:04 -0800 (PST)
Message-ID: <8499950a0802261910t55b3f80r1139c9c13ab9b198@mail.gmail.com>
Date: Wed, 27 Feb 2008 04:10:04 +0100
From: "Oleg Verych" <olecom@gmail.com>
Subject: why filename extensions? (Re: [PATCH] Compress kernel modules on installation.)
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Adrian Bunk <bunk@kernel.org>
Cc: Willy Tarreau <w@1wt.eu>, Steve Brokenshire <sbrokenshire@xestia.co.uk>, linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org

On Tue, Feb 26, 2008 at 1:30 PM, Adrian Bunk <bunk@kernel.org> wrote:

>  depmod/modinfo/insmod/modprobe know only if you compile
>  module-init-tools with zlib support.
>
>  And what about the busybox versions?
>
>  A different name would e.g.:
>  - easily allow proper error handling if the userspace modules program
>   doesn't support the compression used
>  - better scale to support additional compressions
>  - give the user a hint what is happening and what might be the problem
>   when anythig goes wrong

Right...

http://article.gmane.org/gmane.linux.debian.devel.dpkg.general/8495
_______
