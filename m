Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-qk1-f193.google.com ([209.85.222.193]:46098 "EHLO
        mail-qk1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726109AbfJAKRq (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 1 Oct 2019 06:17:46 -0400
MIME-Version: 1.0
References: <20191001101429.24965-1-bjorn.topel@gmail.com>
In-Reply-To: <20191001101429.24965-1-bjorn.topel@gmail.com>
From: =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn.topel@gmail.com>
Date: Tue, 1 Oct 2019 12:17:33 +0200
Message-ID: <CAJ+HfNjSPeRrbibG8LtyFOQAtm+Bu425PO5Co+tHn0PkS5-gcg@mail.gmail.com>
Subject: Re: [PATCH bpf] samples/bpf: kbuild: add CONFIG_SAMPLE_BPF Kconfig
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Netdev <netdev@vger.kernel.org>, Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>
Cc: =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn.topel@intel.com>, linux-kbuild@vger.kernel.org, bpf <bpf@vger.kernel.org>, yamada.masahiro@socionext.com

On Tue, 1 Oct 2019 at 12:14, Bj=C3=B6rn T=C3=B6pel <bjorn.topel@gmail.com> =
wrote:
>
> From: Bj=C3=B6rn T=C3=B6pel <bjorn.topel@intel.com>
>
> This commit makes it possible to build the BPF samples via a Kconfig
> option, CONFIG_SAMPLE_BPF. Further, it fixes that samples/bpf/ could
> not be built due to a missing samples/Makefile subdir-y entry, after
> the introduction of commit 394053f4a4b3 ("kbuild: make single targets
> work more correctly").
>
> Signed-off-by: Bj=C3=B6rn T=C3=B6pel <bjorn.topel@intel.com>

I didn't add a Fixes:-tag for the kbuild commit above; The fix is a
fallout from the kbuild change.
