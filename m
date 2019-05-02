Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-eopbgr710117.outbound.protection.outlook.com ([40.107.71.117]:8421
        "EHLO NAM05-BY2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726091AbfEBSPT (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 2 May 2019 14:15:19 -0400
From: <Tim.Bird@sony.com>
Subject: RE: [PATCH v2 16/17] kernel/sysctl-test: Add null pointer test for
 sysctl.c:proc_dointvec()
Date: Thu, 2 May 2019 18:14:53 +0000
Message-ID: <ECADFF3FD767C149AD96A924E7EA6EAF9770A3A0@USCULXMSG01.am.sony.com>
References: <20190501230126.229218-1-brendanhiggins@google.com>
 <20190501230126.229218-17-brendanhiggins@google.com>
 <20190502110347.GE12416@kroah.com>
In-Reply-To: <20190502110347.GE12416@kroah.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: gregkh@linuxfoundation.org, brendanhiggins@google.com
Cc: frowand.list@gmail.com, keescook@google.com, kieran.bingham@ideasonboard.com, mcgrof@kernel.org, robh@kernel.org, sboyd@kernel.org, shuah@kernel.org, devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org, kunit-dev@googlegroups.com, linux-doc@vger.kernel.org, linux-fsdevel@vger.kernel.org, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, linux-nvdimm@lists.01.org, linux-um@lists.infradead.org, Alexander.Levin@microsoft.com, amir73il@gmail.com, dan.carpenter@oracle.com, dan.j.williams@intel.com, daniel@ffwll.ch, jdike@addtoit.com, joel@jms.id.au, julia.lawall@lip6.fr, khilman@baylibre.com, knut.omang@oracle.com, logang@deltatee.com, mpe@ellerman.id.au, pmladek@suse.com, richard@nod.at, rientjes@google.com, rostedt@goodmis.org, wfg@linux.intel.com, yzaikin@google.com



> -----Original Message-----
> From: Greg KH=20
>=20
> On Wed, May 01, 2019 at 04:01:25PM -0700, Brendan Higgins wrote:
> > From: Iurii Zaikin <yzaikin@google.com>
> >
> > KUnit tests for initialized data behavior of proc_dointvec that is
> > explicitly checked in the code. Includes basic parsing tests including
> > int min/max overflow.
> >
> > Signed-off-by: Iurii Zaikin <yzaikin@google.com>
> > Signed-off-by: Brendan Higgins <brendanhiggins@google.com>
> > ---
> >  kernel/Makefile      |   2 +
> >  kernel/sysctl-test.c | 292
> +++++++++++++++++++++++++++++++++++++++++++
> >  lib/Kconfig.debug    |   6 +
> >  3 files changed, 300 insertions(+)
> >  create mode 100644 kernel/sysctl-test.c
> >
> > diff --git a/kernel/Makefile b/kernel/Makefile
> > index 6c57e78817dad..c81a8976b6a4b 100644
> > --- a/kernel/Makefile
> > +++ b/kernel/Makefile
> > @@ -112,6 +112,8 @@ obj-$(CONFIG_HAS_IOMEM) +=3D iomem.o
> >  obj-$(CONFIG_ZONE_DEVICE) +=3D memremap.o
> >  obj-$(CONFIG_RSEQ) +=3D rseq.o
> >
> > +obj-$(CONFIG_SYSCTL_KUNIT_TEST) +=3D sysctl-test.o
>=20
> You are going to have to have a "standard" naming scheme for test
> modules, are you going to recommend "foo-test" over "test-foo"?  If so,
> that's fine, we should just be consistant and document it somewhere.
>=20
> Personally, I'd prefer "test-foo", but that's just me, naming is hard...

My preference would be "test-foo" as well.  Just my 2 cents.
 -- Tim
