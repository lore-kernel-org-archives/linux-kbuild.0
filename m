Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-eopbgr140057.outbound.protection.outlook.com ([40.107.14.57]:50760
        "EHLO EUR01-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725900AbfHKJ4F (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 11 Aug 2019 05:56:05 -0400
From: Leon Romanovsky <leonro@mellanox.com>
Subject: Re: [PATCH 11/11] treewide: remove dummy Makefiles for single targets
Date: Sun, 11 Aug 2019 09:55:58 +0000
Message-ID: <20190811095555.GF28049@mtr-leonro.mtl.com>
References: <20190810155307.29322-1-yamada.masahiro@socionext.com>
 <20190810155307.29322-12-yamada.masahiro@socionext.com>
In-Reply-To: <20190810155307.29322-12-yamada.masahiro@socionext.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-ID: <D00E1D38B2CAF44D82BE59CBB71B2DAA@eurprd05.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: "linux-kbuild@vger.kernel.org" <linux-kbuild@vger.kernel.org>, Christoph Hellwig <hch@lst.de>, Sam Ravnborg <sam@ravnborg.org>, Alexei Starovoitov <ast@kernel.org>, Boris Pismenny <borisp@mellanox.com>, Daniel Borkmann <daniel@iogearbox.net>, "David S. Miller" <davem@davemloft.net>, Igor Russkikh <igor.russkikh@aquantia.com>, Jakub Kicinski <jakub.kicinski@netronome.com>, Martin KaFai Lau <kafai@fb.com>, Saeed Mahameed <saeedm@mellanox.com>, Song Liu <songliubraving@fb.com>, Yonghong Song <yhs@fb.com>, "bpf@vger.kernel.org" <bpf@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-rdma@vger.kernel.org" <linux-rdma@vger.kernel.org>, "netdev@vger.kernel.org" <netdev@vger.kernel.org>, "oss-drivers@netronome.com" <oss-drivers@netronome.com>

On Sun, Aug 11, 2019 at 12:53:07AM +0900, Masahiro Yamada wrote:
> Now that the single target build descends into sub-directories
> in the same ways as the normal build, these dummy Makefiles
> are not needed any more.
>
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> ---
>

It is hard to test/review/ack on this patch without seeing previous
patches, especially patch #10 where you changed logic of single targets.

Thanks
