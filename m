Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from hrndva-omtalb.mail.rr.com ([71.74.56.122]:11448 "EHLO
	hrndva-omtalb.mail.rr.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1758114Ab3D2SAV (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 29 Apr 2013 14:00:21 -0400
Message-ID: <1367258419.30667.20.camel@gandalf.local.home>
Subject: Re: strange behaviour from "make localmodconfig" throws out ath9k
 stuff
From: Steven Rostedt <rostedt@goodmis.org>
Date: Mon, 29 Apr 2013 14:00:19 -0400
In-Reply-To: <alpine.DEB.2.02.1304291121180.26536@oneiric>
References: <alpine.DEB.2.02.1304261459030.17575@oneiric>
	    <20130427153833.GC3355@free.fr>
	    <alpine.DEB.2.02.1304271325240.12586@oneiric>
	    <20130427174226.GA25088@free.fr>
	    <alpine.DEB.2.02.1304271412250.27554@oneiric>
	    <20130428202854.GC4571@free.fr>
	 <alpine.DEB.2.02.1304290645150.16211@oneiric>
	   <1367244700.28120.6.camel@fedora>
	   <alpine.DEB.2.02.1304291022320.9234@oneiric>
	  <1367246499.30667.9.camel@gandalf.local.home>
	  <alpine.DEB.2.02.1304291056410.13584@oneiric>
	 <1367248388.30667.13.camel@gandalf.local.home>
	 <alpine.DEB.2.02.1304291121180.26536@oneiric>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>

Can you add this patch and see if it fixes your issue. If so, can I add
your "tested-by" to this patch?

Thanks,

-- Steve

diff --git a/scripts/kconfig/streamline_config.pl b/scripts/kconfig/streamline_config.pl
index 3368939..4606cdf 100644
--- a/scripts/kconfig/streamline_config.pl
+++ b/scripts/kconfig/streamline_config.pl
@@ -156,7 +156,6 @@ sub read_kconfig {
 
     my $state = "NONE";
     my $config;
-    my @kconfigs;
 
     my $cont = 0;
     my $line;
@@ -190,7 +189,13 @@ sub read_kconfig {
 
 	# collect any Kconfig sources
 	if (/^source\s*"(.*)"/) {
-	    $kconfigs[$#kconfigs+1] = $1;
+	    my $kconfig = $1;
+	    # prevent reading twice.
+	    if (!defined($read_kconfigs{$kconfig})) {
+		$read_kconfigs{$kconfig} = 1;
+		read_kconfig($kconfig);
+	    }
+	    next;
 	}
 
 	# configs found
@@ -250,14 +255,6 @@ sub read_kconfig {
 	}
     }
     close($kinfile);
-
-    # read in any configs that were found.
-    foreach my $kconfig (@kconfigs) {
-	if (!defined($read_kconfigs{$kconfig})) {
-	    $read_kconfigs{$kconfig} = 1;
-	    read_kconfig($kconfig);
-	}
-    }
 }
 
 if ($kconfig) {


