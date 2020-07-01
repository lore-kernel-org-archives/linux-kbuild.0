Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:59892 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1731759AbgGAP4D (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 1 Jul 2020 11:56:03 -0400
Message-ID: <4c23e1d782be86a965f5fbc4592f7bbd515d37bb.camel@redhat.com>
Subject: Re: [PATCH v3.1 7/7] kconfig: qconf: navigate menus on hyperlinks
From: Maxim Levitsky <mlevitsk@redhat.com>
Date: Wed, 01 Jul 2020 18:55:39 +0300
In-Reply-To: <20200701175144.501abc91@coco.lan>
References: <cover.1593498345.git.mchehab+huawei@kernel.org>
         <6f7162e40f127e76c7169315d33a14946a85719a.1593498345.git.mchehab+huawei@kernel.org>
         <20200630084835.4db1331f@coco.lan>
         <CAK7LNARjZWwKeFXMbDy76jYu21oCckz8qxkMSu7y1xmL+a3C3g@mail.gmail.com>
         <20200701175144.501abc91@coco.lan>
Content-Type: text/plain; charset="UTF-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, Masahiro Yamada <masahiroy@kernel.org>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

On Wed, 2020-07-01 at 17:51 +0200, Mauro Carvalho Chehab wrote:
> Em Thu, 2 Jul 2020 00:21:36 +0900
> Masahiro Yamada <masahiroy@kernel.org> escreveu:
> 
> > On Tue, Jun 30, 2020 at 3:48 PM Mauro Carvalho Chehab
> > <mchehab+huawei@kernel.org> wrote:
> > > Instead of just changing the helper window to show a
> > > dependency, also navigate to it at the config and menu
> > > widgets.
> > > 
> > > Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> > > 
> > > 
> > > ---
> > > 
> > > I ended re-sending the same version as on patch series 2.  
> > 
> > Do you mean this one should substitute 7/7 in v3, right?
> 
> Yes.
> 
> > Applied to linux-kbuild.
> 
> Thank you!
> 
> Mauro
> 

I tested these series yestarday, but found a but which I haven't yet had time to debug.
Now when I click on a item that goes to a submenu in the right panel, the app
segfaults. I'll debug this soon.


Best regards,
	Maxim evitsky
