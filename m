Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-eopbgr730136.outbound.protection.outlook.com ([40.107.73.136]:13984
        "EHLO NAM05-DM3-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727561AbeJaBqS (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 30 Oct 2018 21:46:18 -0400
From: Paul Burton <paul.burton@mips.com>
Subject: Re: [PATCH v2 1/2] kbuild: replace cc-name test with
 CONFIG_CC_IS_CLANG
Date: Tue, 30 Oct 2018 16:51:58 +0000
Message-ID: <20181030165156.k6blbpbxh2fmiiay@pburton-laptop>
References: <1540905994-6073-1-git-send-email-yamada.masahiro@socionext.com>
In-Reply-To: <1540905994-6073-1-git-send-email-yamada.masahiro@socionext.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-ID: <256788EA86DFB442B581ECDC903CFAAF@namprd22.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: "linux-kbuild@vger.kernel.org" <linux-kbuild@vger.kernel.org>, "linux-mips@linux-mips.org" <linux-mips@linux-mips.org>, James Hogan <jhogan@kernel.org>, Michael Ellerman <mpe@ellerman.id.au>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Michal Marek <michal.lkml@markovi.net>, Paul Mackerras <paulus@samba.org>, Ralf Baechle <ralf@linux-mips.org>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>

Hi Masahiro,

On Tue, Oct 30, 2018 at 10:26:33PM +0900, Masahiro Yamada wrote:
> Evaluating cc-name invokes the compiler every time even when you are
> not compiling anything, like 'make help'. This is not efficient.
>=20
> The compiler type has been already detected in the Kconfig stage.
> Use CONFIG_CC_IS_CLANG, instead.
>=20
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> Acked-by: Michael Ellerman <mpe@ellerman.id.au> (powerpc)

Looks good to me:

    Acked-by: Paul Burton <paul.burton@mips.com> (MIPS)

Thanks,
    Paul
