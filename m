Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from oproxy3-pub.bluehost.com ([69.89.21.8]:40819 "HELO
	oproxy3-pub.bluehost.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with SMTP id S1755899Ab1GJSCo convert rfc822-to-8bit (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Sun, 10 Jul 2011 14:02:44 -0400
Date: Sun, 10 Jul 2011 11:02:41 -0700
From: Randy Dunlap <rdunlap@xenotime.net>
Subject: Re: [PATCH] Avoid Wunused-but-set warning
Message-Id: <20110710110241.7650e03f.rdunlap@xenotime.net>
In-Reply-To: <CACqU3MUFO9DGqnK99ApaKn00vzj5rCB5=kjuSZGZpPU8c_4G-A@mail.gmail.com>
References: <da20dc5c4160ed9a3da52f60799a1e4369fe3f27.1310228130.git.rprabhu@wnohang.net>
	<CAM_iQpXeqc01dyHpViyJCMSz6wz-1mWmGi=J0UynUG8tbd99kw@mail.gmail.com>
	<CACqU3MUgVTpc6kBvBiw7rtyn_JTA-JPrbnvai3Vnq+UWk-jSbQ@mail.gmail.com>
	<CAOJsxLF+4VOXJwRJL7npMngDTGztXk739_GcMLxsMzmsVcDCVw@mail.gmail.com>
	<CACqU3MUFO9DGqnK99ApaKn00vzj5rCB5=kjuSZGZpPU8c_4G-A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8BIT
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Arnaud Lacombe <lacombar@gmail.com>
Cc: Pekka Enberg <penberg@kernel.org>, =?ISO-8859-1?Q?Am=E9rico?= Wang <xiyou.wangcong@gmail.com>, Raghavendra D Prabhu <rprabhu@wnohang.net>, linux-kbuild@vger.kernel.org, Nir Tzachar <nir.tzachar@gmail.com>, linux-kernel@vger.kernel.org

On Sun, 10 Jul 2011 12:49:20 -0400 Arnaud Lacombe wrote:

> Hi,
> 
> On Sun, Jul 10, 2011 at 12:28 PM, Pekka Enberg <penberg@kernel.org> wrote:
> > On Sun, Jul 10, 2011 at 7:24 PM, Arnaud Lacombe <lacombar@gmail.com> wrote:
> >> Hi,
> >>
> >> On Sun, Jul 10, 2011 at 12:16 PM, Américo Wang <xiyou.wangcong@gmail.com> wrote:
> >>> On Sun, Jul 10, 2011 at 12:24 AM, Raghavendra D Prabhu
> >>> <rprabhu@wnohang.net> wrote:
> >>>> Hi,
> >>>>    I am seeing Wunused-but-set warning while make nconfig.  Looks like
> >>>>    active_menu is not used. Removing it fixes the warning.
> >>>>
> >>>> Signed-off-by: Raghavendra D Prabhu <rprabhu@wnohang.net>
> >>>
> >>> Acked-by: WANG Cong <xiyou.wangcong@gmail.com>
> >>>
> >> Out of curiosity, what is your status to ACK such patch ?
> >
> > What kind of status do you need to ACK such a simple patch?
> >
> As per Documentation/SubmittingPatches:
> 
> <<
> 13) When to use Acked-by: and Cc:
> The Signed-off-by: tag indicates that the signer was involved in the
> development of the patch, or that he/she was in the patch's delivery path.
> 
> If a person was not directly involved in the preparation or handling of a
> patch but wishes to signify and record their approval of it then they can
> arrange to have an Acked-by: line added to the patch's changelog.
> 
> Acked-by: is often used by the maintainer of the affected code when that
> maintainer neither contributed to nor forwarded the patch.
> >>
> 
> That said, it is not a strong requirement... unfortunately. So, let's
> have some fun and go ACK thousand of trivial patch just to generate
> traffic on the LKML and give myself self-importance :-)

Acked-by: is mostly used as a weak version of Reviewed-by:
and the "definition" in SubmittingPatches is not accurate IMO.
I.e., it can be used by anyone.

---
~Randy
*** Remember to use Documentation/SubmitChecklist when testing your code ***
