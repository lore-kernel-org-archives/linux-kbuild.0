Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:55244 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725845AbgF3GZP (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 30 Jun 2020 02:25:15 -0400
Date: Tue, 30 Jun 2020 08:25:11 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Subject: Re: [PATCH v2 5/5] kconfig: qconf: navigate menus on hyperlinks
Message-ID: <20200630082511.6f1f92c7@coco.lan>
In-Reply-To: <CAK7LNASbWXkRZ3OrmDSXj4jfu6jGcMnjnOOJ4+cV22fweJ9OJA@mail.gmail.com>
References: <cover.1593423060.git.mchehab+huawei@kernel.org>
        <45fa5ad583de1766de6169366df1df5837c5dc7c.1593423060.git.mchehab+huawei@kernel.org>
        <CAK7LNASbWXkRZ3OrmDSXj4jfu6jGcMnjnOOJ4+cV22fweJ9OJA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: Maxim Levitsky <mlevitsk@redhat.com>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

Em Tue, 30 Jun 2020 12:36:27 +0900
Masahiro Yamada <masahiroy@kernel.org> escreveu:

> On Mon, Jun 29, 2020 at 6:35 PM Mauro Carvalho Chehab
> <mchehab+huawei@kernel.org> wrote:
> >
> > Instead of just changing the helper window to show a
> > dependency, also navigate to it at the config and menu
> > widgets.
> >
> > Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> > ---  
> 
> 
> I noticed a regression.
> 
> Visit "Networking support",
> and click "select: BPF"
> from the window at the bottom.
> 
> Nothing happens except the following error message
> in the console:
> 
> Clicked menu is invalid: ^BPF$
> 
> 
> If I apply only 1-4 in this series,
> this works fine.

Hmm... perhaps this is related to symbol visibility. If the clicked
link is not visible, it won't be able to present the Kconfig option.

I guess we can implement a mixed approach here: update just the
configInfo data if it can't find the clicked item as a menu, like
the enclosed patch.

I'll send an updated version with this hybrid approach.

Thanks,
Mauro

diff --git a/scripts/kconfig/qconf.cc b/scripts/kconfig/qconf.cc
index f49fbac91995..fd721c6c4c94 100644
--- a/scripts/kconfig/qconf.cc
+++ b/scripts/kconfig/qconf.cc
@@ -1263,10 +1263,13 @@ void ConfigInfoView::clicked(const QUrl &url)
 		    break;
 	}
 
-	if (!m)
-		qInfo() << "Clicked menu is invalid:" << data;
-	else
+	if (!m) {
+		/* Symbol is not visible as a menu */
+		symbolInfo();
+		emit showDebugChanged(true);
+	} else {
 		emit menuSelected(m);
+	}
 
 	free(result);
 	delete data;
