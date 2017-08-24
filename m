Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:41746 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751840AbdHXPe7 (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 24 Aug 2017 11:34:59 -0400
Date: Thu, 24 Aug 2017 18:34:56 +0300
From: Leon Romanovsky <leon@kernel.org>
Subject: Re: Possible rdma-core header conflict
Message-ID: <20170824153456.GM1724@mtr-leonro.local>
References: <CACTTzNa3EzABie9=h2X-ONBefyaoWE1+RAT-T+uxJVvVij15Rg@mail.gmail.com>
 <20170821120310.GL1724@mtr-leonro.local>
 <20170821155729.GC4401@obsidianresearch.com>
 <CACTTzNar-qBRxkeWHL-gt4C9A6yTbY+GbkTT6tWKvJcnpK=J_g@mail.gmail.com>
 <20170822064704.GR1724@mtr-leonro.local>
 <20170824105007.GH1724@mtr-leonro.local>
 <CACTTzNYiYCg-hYX8WGYpn6Yg4QZ=XqgQcyB-m_9cSd5D+w0juQ@mail.gmail.com>
 <20170824122328.GJ1724@mtr-leonro.local>
 <20170824152713.GB23110@obsidianresearch.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="0OkqknLvuh6i3jtt"
Content-Disposition: inline
In-Reply-To: <20170824152713.GB23110@obsidianresearch.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Jason Gunthorpe <jgunthorpe@obsidianresearch.com>
Cc: Yigal Korman <yigal@plexistor.com>, mmarek@suse.com, linux-kbuild@vger.kernel.org, dhowells@redhat.com, Linux RDMA Mailing List <linux-rdma@vger.kernel.org>


--0OkqknLvuh6i3jtt
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Aug 24, 2017 at 09:27:13AM -0600, Jason Gunthorpe wrote:
> On Thu, Aug 24, 2017 at 03:23:28PM +0300, Leon Romanovsky wrote:
>
> > For the development, I use ability of rdma-core to run everything in
> > place and I don't install anything. I compile with build.sh supplied
> > in rdma-core and adjust Makefiles to point to build/lib|include directories
> > without need to install.
>
> For development you can also tell rdma-core to refer to the kernel
> source tree directly and it will immediately use those kernel
> header for RDMA. No need to install things and wreck your distro.
>
> #  -DKERNEL_DIR='.../linux' (default '')
> #      If set use the kernel UAPI headers from this kernel source
> #      tree.
>

We need to change default to '.../linux-rdma', so it will work
out of the box for me :)

> Jason

--0OkqknLvuh6i3jtt
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEkhr/r4Op1/04yqaB5GN7iDZyWKcFAlme8iAACgkQ5GN7iDZy
WKeTmw/+I6jyWsrFPc4Yej8RaVAP1OXohyXueKhmdQHnqxdEwE2e69u5HMi0TNi2
Diyt53ZKAjy5bWRHREJo/zd4dsbfQDMR5apWX+9lMVTGM11r3SN1/iAbEYc+B3Lq
lrXQSXkHmLArYds7vUxOkF8VqV9qT6ua81CLItUl1d2Oyexvpu00Ry+CrHHcTrdY
xyJ7XXnyf+ztJejaJUWscp6xpmkPruE21JQ7lI1bVYB7P7WNCws26lEMaxFQ6wA8
4A9MaKXWDlyBLDe2UwhADTDLOO1ojodF48AROTvJgP8mi2Xh8rKDX9kV9seuYAxd
jqFcmZm5/vnFCWSCxGryyXHvpTrl+bW6Hbf0OhQOXjtqWTa9AHNuMP9gZ6qiO/aH
lqoVYBAj9C+/KNUPyNqmBm460k7Zyosndtl4sO5nU0DN0IbjPCgq2J1A8fHk0hdE
tCznhrFTDFpH/mYama5nueOHobXCSPsMnva8eSmjdfBZFds0f0KKok+WEwiCsIGK
YxphIRsU/f/0fuGaD3T/hsHwxl4ACx0PV6EjjlXb4jqB738+JwDoTQyK7C+p6Trt
/F3s3VEdraFR6c0VQb9ZKSjU981k7TAP+hWbYOw6DGZmqF9V9ZeGdgtffiJSM210
SC9pzl4jbDsco7Qnb2OK7V1kqssfub98YT3W73SbVNZeSXvrBGY=
=IcRU
-----END PGP SIGNATURE-----

--0OkqknLvuh6i3jtt--
