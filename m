Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-yw0-f174.google.com ([209.85.161.174]:33124 "EHLO
        mail-yw0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751076AbdHSC3r (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 18 Aug 2017 22:29:47 -0400
Received: by mail-yw0-f174.google.com with SMTP id p68so68312775ywg.0
        for <linux-kbuild@vger.kernel.org>; Fri, 18 Aug 2017 19:29:47 -0700 (PDT)
Date: Fri, 18 Aug 2017 22:29:50 -0400
From: Tom Rini <trini@konsulko.com>
Subject: Re: [PATCH] dts: Make it easier to enable __symbols__ generation in
 dtb files
Message-ID: <20170819022950.GH17193@bill-the-cat>
References: <1502930102-8648-1-git-send-email-trini@konsulko.com>
 <59953868.5060209@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="CNfT9TXqV7nd4cfk"
Content-Disposition: inline
In-Reply-To: <59953868.5060209@gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Frank Rowand <frowand.list@gmail.com>
Cc: devicetree@vger.kernel.org, Tero Kristo <t-kristo@ti.com>, Nishanth Menon <nm@ti.com>, Tomi Valkeinen <tomi.valkeinen@ti.com>, Sekhar Nori <nsekhar@ti.com>, Jason Kridner <jkridner@beagleboard.org>, Drew Fustini <drew@beagleboard.org>, Robert Nelson <robertcnelson@gmail.com>, Lokesh Vutla <lokeshvutla@ti.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Russell King <linux@armlinux.org.uk>, Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <mmarek@suse.com>, linux-kbuild@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org


--CNfT9TXqV7nd4cfk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 16, 2017 at 11:32:08PM -0700, Frank Rowand wrote:
> Hi Tom,
>=20
> Some nit picking on the patch comment.  :-)
>=20
>=20
> On 08/16/17 17:35, Tom Rini wrote:
> > This introduces the variabe DTC_EXTRA_FLAGS to allow for additional
> > flags to be passed to dtc.  While this can have many uses (such as
> > easier testing of new warning flags) the use case I wish to spell out
> > here is passing of -@ to enable __symbols__ to be included in the
> > resulting dtb and thus 'stacked' overlays to be able to be used.
>=20
> Not just stacked overlays (I'm guessing by that you mean an
> overlay applied on top of an overlay), but even an overlay on
> top of the base dtb.

In the case of outside of the kernel, we can today have some classes of
overlays that work today.  "Stacked" is how Pantelis has been referring
to overlays that make use of __symbols__ so that we can resolve
references.  I guess this ended up being referenced as plugin support in
dtc.git tho?  I'm not quite sure how to re-word the above to be clear
that it's extending what can be used.

> > When passing in -@ this will increase the size of the dtb (and resident
> > memory usage) in exchange for allowing more types of overlays to be
> > applied to the dtb file prior to passing it to Linux and additional
> > functionality within the kernel when OF_OVERLAY is enabled and in tools
> > outside of the kernel.
>=20
> Not so much additional functionality within the kernel.  It is basic
> functionality for any overlay to be applied in the kernel.

Oh, I thought the kernel already handled using that information.  I'll
think how to reword the line there then.

> > Cc: Jason Kridner <jkridner@beagleboard.org>
> > Cc: Drew Fustini <drew@beagleboard.org>
> > Cc: Robert Nelson <robertcnelson@gmail.com>
> > Cc: Lokesh Vutla <lokeshvutla@ti.com>
> > Cc: Frank Rowand <frowand.list@gmail.com>
> > Cc: Rob Herring <robh+dt@kernel.org>
> > Cc: Mark Rutland <mark.rutland@arm.com>
> > Cc: Russell King <linux@armlinux.org.uk>
> > Cc: Masahiro Yamada <yamada.masahiro@socionext.com>
> > Cc: Michal Marek <mmarek@suse.com>
> > CC: linux-kbuild@vger.kernel.org
> > Cc: devicetree@vger.kernel.org
> > Cc: linux-arm-kernel@lists.infradead.org
> > Cc: linux-kernel@vger.kernel.org
> > Signed-off-by: Tom Rini <trini@konsulko.com>
> > ---
> > This would be v3 of my attempt to enable __symbols__ more widely (v2,
> > for people not on the CC, enabled it always, but for some boards).
> >=20
> > To be clear, this version of the patch is more flexible in that it
> > allows for arbitrary flags to be passed to dtc, which can have other
> > uses.  But, I'm still spelling out -@ being the motivation behind this
> > for clarity.
>=20
> Thank you, that is very useful info to capture in the commit history.
>=20
>=20
> > Both Frank and Rob were uncomfortable with v2, and Frank
> > suggested this approach to make it easier for users  / distributions /
> > etc to opt-in to this functionality.  For clarity, Frank was suggesting
> > (at least at first) perhaps also a tie-in CONFIG option, which I have
> > not done here as I feel that's adding extra hurdles to something that
> > must already be opt-in.  Given that today many of the immediate uses are
> > for "pre-boot" application of overlays (SoM + carrier + add-ons or EVM +
> > LCD for example), I believe this is an acceptable trade-off to make
> > currently.
>=20
> If I understand correctly, then you are following Rob's suggestion of
> passing the DTC_EXTRA_FLAGS value in the dtb make command.
>=20
> That seems to be a reasonable approach for now.  Rob did mention that
> he would like to remove the current hard coding of a base DTC_FLAGS
> value, where several architectures initialize it with one of:
>=20
>    DTC_FLAGS ?=3D -p 1024
>    DTC_FLAGS :=3D -p 1024
>=20
> If those initializations can be removed, then we could just use
> DTC_FLAGS in the make command, instead of adding DTC_EXTRA_FLAGS.
> Can you discuss that option with Rob?  (Sorry Rob, I'll be off-grid
> soon.)

With respect to the current users of DTC_FLAGS, we could just change c6x
/ microblaze / openrisc / powerpc to use '+=3D' not '?=3D' or ':=3D' as
one-line patches, from a quick test on microblaze.  Or maybe I'm missing
something?

But we can't only pass DTC_FLAGS on the command-line directly, unless we
also pass in all other valid and normal flags (ie
-Wno-unit_address_vs_reg).  This is in-line with how for example CFLAGS
is handled in the kernel, rather than by what, based on some googling,
Makefiles can be made to do, in general.  Thanks!

--=20
Tom

--CNfT9TXqV7nd4cfk
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJZl6KeAAoJEIf59jXTHXZSYK4QAMVRzUktum3schQPo6cCBRVP
8AZyzy9cLbsNiJkbjrnWvW9tU9K4+2oysBbMWUC2xyL+BJreOtpFHm+5iNKz1KMS
nYJV0dQoQBMmnDilWa4SsMLJph2vbfUaYn5vn00xeSLkwg0oEoTL4BEfcVUt9aAJ
AF946+KGwaanDGEzx9X5hUtSFqrb8SpefzEg0U4YHOcX6TcaGEjkQvZLBTjErpNT
ZGaSIFnBL1+4OgfLVTd9cqgUcbBtG57zjDVXuCcIloXwWWd+ZL6LNGz0vaOMlDzT
vtA9sZJhoL1S0xI11CXnlyEn615NRHoTQkBdHsvTjqzE3UGI2H0evg9No2JkRcsY
JHeU/zOOX6nsM5Ycd8jft6/LmgdxigliEJk+Fn5wqF4Tbigdwud8EjH375TTOGC5
H3X6yVObHBX3mscI7VieFE3VRdnJFAfFToWjp2spTpvNCZ1VdbFDgdLaEZBZQ3JW
606sazQoXATGqbc7gYtuSYNAtxVW0ScqncwFzt4aARCj3RaJKxvu+0WfmH1H9sn6
gArBwk8OCmytGcFM3Q6vr8u70Y3KAi+EIHELaPqHb7uL+ZaYtk7AxSCTAt5WgTrg
czPweTBHJx75hTdqTDK4NBTk/Q2fCbKGlFy8CLtkul53tdRV8yNcO3WI8dIBbiD5
Gz9nGI0WrVuQYUE6pqqT
=N/Lv
-----END PGP SIGNATURE-----

--CNfT9TXqV7nd4cfk--
