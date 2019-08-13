Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:54704 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726878AbfHMWol (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 13 Aug 2019 18:44:41 -0400
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <CAL_JsqLivZNf9A2bVXKf8eqdmsywQV+KEh5dYVLywNQPfn0P=w@mail.gmail.com>
References: <20190813183825.9605-1-sboyd@kernel.org> <CAL_JsqLivZNf9A2bVXKf8eqdmsywQV+KEh5dYVLywNQPfn0P=w@mail.gmail.com>
Subject: Re: [PATCH] devicetree: Expose dtbs_check and dt_binding_check some more
From: Stephen Boyd <sboyd@kernel.org>
Date: Tue, 13 Aug 2019 15:44:39 -0700
Message-Id: <20190813224440.0468920644@mail.kernel.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Rob Herring <robh+dt@kernel.org>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Masahiro Yamada <yamada.masahiro@socionext.com>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, devicetree@vger.kernel.org, Linux Doc Mailing List <linux-doc@vger.kernel.org>

Quoting Rob Herring (2019-08-13 15:32:48)
> On Tue, Aug 13, 2019 at 12:38 PM Stephen Boyd <sboyd@kernel.org> wrote:
> >
> > It wasn't obvious that this was a command to run based on 'make help',
> > so add it to the top-level help for devicetree builds. Also, add an
> > example to the documentation to show that db_binding_check can be run
> > with DT_SCHEMA_FILES=3D to only check one schema file instead of all of
> > them.
> >
> > Cc: Masahiro Yamada <yamada.masahiro@socionext.com>
> > Cc: <linux-kbuild@vger.kernel.org>
> > Cc: <devicetree@vger.kernel.org>
> > Cc: <linux-doc@vger.kernel.org>
> > Signed-off-by: Stephen Boyd <sboyd@kernel.org>
> > ---
> >
> > I didn't find this sent, so sending again!
>=20
> You had. :)

Oh no, sorry! :(

>=20
> >
> >  Documentation/devicetree/writing-schema.md | 1 +
> >  Makefile                                   | 6 ++++--
> >  2 files changed, 5 insertions(+), 2 deletions(-)
>=20
> writing-schema.md got converted to rst, so I fixed up and applied.

Thanks!
