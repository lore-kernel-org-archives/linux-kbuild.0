Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:46235 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726212AbfKLFmt (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 12 Nov 2019 00:42:49 -0500
Date: Mon, 11 Nov 2019 21:42:37 -0800 (PST)
Message-Id: <20191111.214237.704198386375428842.davem@redhat.com>
Subject: Re: [net-next PATCH] samples/bpf: adjust Makefile and README.rst
From: David Miller <davem@redhat.com>
In-Reply-To: <157340347607.14617.683175264051058224.stgit@firesoul>
References: <157340347607.14617.683175264051058224.stgit@firesoul>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: brouer@redhat.com
Cc: linux-kbuild@vger.kernel.org, netdev@vger.kernel.org, acme@kernel.org, borkmann@iogearbox.net, alexei.starovoitov@gmail.com

From: Jesper Dangaard Brouer <brouer@redhat.com>
Date: Sun, 10 Nov 2019 17:31:16 +0100

> Side effect of some kbuild changes resulted in breaking the
> documented way to build samples/bpf/.
>=20
> This patch change the samples/bpf/Makefile to work again, when
> invoking make from the subdir samples/bpf/. Also update the
> documentation in README.rst, to reflect the new way to build.
>=20
> Signed-off-by: Jesper Dangaard Brouer <brouer@redhat.com>

Applied.
