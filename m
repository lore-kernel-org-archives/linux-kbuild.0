Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-wr1-f47.google.com ([209.85.221.47]:38835 "EHLO
        mail-wr1-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726126AbfGYT4i (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 25 Jul 2019 15:56:38 -0400
Date: Thu, 25 Jul 2019 22:56:33 +0300
From: Alexey Dobriyan <adobriyan@gmail.com>
Subject: .h.s files spam
Message-ID: <20190725195633.GA15202@avx2>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org

What are these files for?

	$ cat ../obj/include/linux/kernel.h.s
        .file   "null"
        .text
        .ident  "GCC: (Gentoo 9.1.0-r1 p1.1) 9.1.0"
        .section        .note.GNU-stack,"",@progbits

	$ find ../obj/ -type f -name '*.s' | wc -l
	4047

It is "allyesconfig" in case someone is going to reproduce it.
