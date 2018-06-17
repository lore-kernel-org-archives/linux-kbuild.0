Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from stumail.xidian.edu.cn ([202.117.112.40]:50783 "HELO
        stu.xidian.edu.cn" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with SMTP id S934229AbeFQLgu (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 17 Jun 2018 07:36:50 -0400
Message-ID: <1529235406.17103.2.camel@stu.xidian.edu.cn>
Subject: Re: [PATCH] Kbuild: fix mismatched if/endif pairs
From: Xi Ruoyao <ryxi@stu.xidian.edu.cn>
Date: Sun, 17 Jun 2018 19:36:46 +0800
In-Reply-To: <18061719212289a3d6de53ebc1ba6c4a188e1b0779da@stu.xidian.edu.cn>
References: <18061719212289a3d6de53ebc1ba6c4a188e1b0779da@stu.xidian.edu.cn>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>
Cc: ryxi@stu.xidian.edu.cn, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org

On 2018-06-17 18:16 +0800, Xi Ruoyao wrote:
> In scripts/Makefile.build, there are two mismatched if/endif pairs.
> They stop the generation of orc unwind table if CONFIG_FTRACE_MCOUNT_RECORD
> is not set.  dmesg complains:

Duplication of patch 10455267 in patchwork.  Sorry for noise :(.

But let's fix this quickly, since the issue breaks ORC unwinder completely
(at least with my configuration).
-- 
Xi Ruoyao <ryxi@stu.xidian.edu.cn>
School of Aerospace Science and Technology, Xidian University
