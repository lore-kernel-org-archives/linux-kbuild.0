Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from asavdk4.altibox.net ([109.247.116.15]:47024 "EHLO
        asavdk4.altibox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725788AbfHJRH5 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 10 Aug 2019 13:07:57 -0400
Date: Sat, 10 Aug 2019 19:07:52 +0200
From: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH v2] kbuild: re-implement detection of CONFIG options
 leaked to user-space
Message-ID: <20190810170752.GA16122@ravnborg.org>
References: <20190810170135.31183-1-yamada.masahiro@socionext.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190810170135.31183-1-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: linux-kbuild@vger.kernel.org, Christoph Hellwig <hch@lst.de>, Arnd Bergmann <arnd@arndb.de>, Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, Martin KaFai Lau <kafai@fb.com>, Song Liu <songliubraving@fb.com>, Yonghong Song <yhs@fb.com>, bpf@vger.kernel.org, linux-kernel@vger.kernel.org, netdev@vger.kernel.org

Hi Masahiro

> Changes in v2:
>   - Add a whitelist. The CONFIG leakages in this list are not warned.
>     This patch can be applied now. A new leakage will be blocked.

Very good!

Acked-by: Sam Ravnborg <sam@ravnborg.org>

	Sam
