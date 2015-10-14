Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mx2.suse.de ([195.135.220.15]:56733 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753580AbbJNOD1 (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 14 Oct 2015 10:03:27 -0400
Date: Wed, 14 Oct 2015 16:03:25 +0200
From: Michal Marek <mmarek@suse.com>
Subject: Re: [PATCH 31/39] Port xconfig to Qt5 - Add horizontal scrollbar,
 and scroll per pixel.
Message-ID: <20151014140325.GA30722@sepie.suse.cz>
References: <1442946999-37018-1-git-send-email-thiago.macieira@intel.com>
 <1442946999-37018-32-git-send-email-thiago.macieira@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1442946999-37018-32-git-send-email-thiago.macieira@intel.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Thiago Macieira <thiago.macieira@intel.com>, linux-kbuild@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Boris Barbulovski <bbarbulovski@gmail.com>

On 2015-09-22 20:36, Thiago Macieira wrote:
> From: Boris Barbulovski <bbarbulovski@gmail.com>
> 
> Signed-off-by: Boris Barbulovski <bbarbulovski@gmail.com>
> Signed-off-by: Thiago Macieira <thiago.macieira@intel.com>
> ---
>  scripts/kconfig/qconf.cc | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/scripts/kconfig/qconf.cc b/scripts/kconfig/qconf.cc
> index e5bfa6b..2ef06c1 100644
> --- a/scripts/kconfig/qconf.cc
> +++ b/scripts/kconfig/qconf.cc
> @@ -318,6 +318,9 @@ ConfigList::ConfigList(ConfigView* p, const char *name)
>  	setSortingEnabled(false);
>  	setRootIsDecorated(true);
>  
> +	setVerticalScrollMode(ScrollPerPixel);
> +	setHorizontalScrollMode(ScrollPerPixel);
> +
>  	setHeaderLabels(QStringList() << _("Option") << _("Name") << "N" << "M" << "Y" << _("Value"));
>  
>  	connect(this, SIGNAL(itemSelectionChanged(void)),
> @@ -453,11 +456,13 @@ void ConfigList::updateList(ConfigItem* item)
>  
>  		updateMenuList(item, rootEntry);
>  		update();
> +		resizeColumnToContents(0);
>  		return;
>  	}
>  update:
>  	updateMenuList(this, rootEntry);
>  	update();
> +	resizeColumnToContents(0);
>  }

Somehow one of the patches to ConfigList (not this one) caused the
columns to take too much space. To reproduce this, enable Show Name,
Show Range and Show Data in the Option menu. Do you see the same issue?
The following patch fixes it for me, but perhaps there is a cleaner way
to do it.

Michal

diff --git a/scripts/kconfig/qconf.cc b/scripts/kconfig/qconf.cc
index 73ce56a76271..1a428127711b 100644
--- a/scripts/kconfig/qconf.cc
+++ b/scripts/kconfig/qconf.cc
@@ -451,13 +451,17 @@ void ConfigList::updateList(ConfigItem* item)
 
 		updateMenuList(item, rootEntry);
 		update();
-		resizeColumnToContents(0);
+		for (int i = 0; i < columnCount(); i++) {
+			resizeColumnToContents(i);
+		}
 		return;
 	}
 update:
 	updateMenuList(this, rootEntry);
 	update();
-	resizeColumnToContents(0);
+	for (int i = 0; i < columnCount(); i++) {
+		resizeColumnToContents(i);
+	}
 }
 
 void ConfigList::setValue(ConfigItem* item, tristate val)

