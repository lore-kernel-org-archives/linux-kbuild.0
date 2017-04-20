Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-oi0-f52.google.com ([209.85.218.52]:36095 "EHLO
        mail-oi0-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S971281AbdDTSEI (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 20 Apr 2017 14:04:08 -0400
Received: by mail-oi0-f52.google.com with SMTP id r203so60853902oib.3
        for <linux-kbuild@vger.kernel.org>; Thu, 20 Apr 2017 11:04:08 -0700 (PDT)
Date: Thu, 20 Apr 2017 11:04:06 -0700
From: Matthias Kaehlcke <mka@chromium.org>
Subject: Re: [PATCH v3] kbuild: Add support to generate LLVM bitcode files
Message-ID: <20170420180406.GI128305@google.com>
References: <20170404172706.171971-1-mka@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20170404172706.171971-1-mka@chromium.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <mmarek@suse.com>, Emese Revfy <re.emese@gmail.com>, Kees Cook <keescook@chromium.org>, Behan Webster <behanw@converseincode.com>, "Luis R . Rodriguez" <mcgrof@kernel.org>, =?utf-8?B?Vmluw61jaXVz?= Tinti <viniciustinti@gmail.com>, Kyeongmin Cho <korea.drzix@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, Grant Grundler <grundler@chromium.org>, Michael Davidson <md@google.com>, Greg Hackmann <ghackmann@google.com>, Peter Foley <pefoley2@pefoley.com>

El Tue, Apr 04, 2017 at 10:27:06AM -0700 Matthias Kaehlcke ha dit:

> From: Vinícius Tinti <viniciustinti@gmail.com>
> 
> Add rules to kbuild in order to generate LLVM bitcode files with the .ll
> extension when using clang.
> 
>   # from c code
>   CC=clang make kernel/pid.ll
> 
>   # from asm code
>   CC=clang make arch/x86/kernel/preempt.ll
> 
> From: Vinícius Tinti <viniciustinti@gmail.com>
> Signed-off-by: Vinícius Tinti <viniciustinti@gmail.com>
> Signed-off-by: Behan Webster <behanw@converseincode.com>
> Signed-off-by: Matthias Kaehlcke <mka@chromium.org>
> ---

Ping, any comments on this patch?

Thanks

Matthias
