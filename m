Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from pasmtpa.tele.dk ([80.160.77.114]:35201 "EHLO pasmtpA.tele.dk"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752349AbYC3TEF (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Sun, 30 Mar 2008 15:04:05 -0400
Date: Sun, 30 Mar 2008 21:04:30 +0200
From: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: wish: build time warning for missing MODULE_LICENSE
Message-ID: <20080330190430.GD19733@uranus.ravnborg.org>
References: <20080330180119.GC1575@cs181133002.pp.htv.fi>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20080330180119.GC1575@cs181133002.pp.htv.fi>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Adrian Bunk <bunk@kernel.org>
Cc: rusty@rustcorp.com.au, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org

On Sun, Mar 30, 2008 at 09:01:19PM +0300, Adrian Bunk wrote:
> I just fixed a bug where I had accidentally removed a MODULE_LICENSE() 
> from a file.
> 
> The problem is that such bugs are currently not discovered until someone 
> actually runs a kernel with this module loaded.
> 
> Could we get a build time warning/error for a missing MODULE_LICENSE?

Is it something as simple as this you are after?
[My dev box is dead atm so I have not done a kernel build
with this, only a single module].

	Sam

diff --git a/scripts/mod/modpost.c b/scripts/mod/modpost.c
index 695b5d6..e8560a0 100644
--- a/scripts/mod/modpost.c
+++ b/scripts/mod/modpost.c
@@ -1552,6 +1552,8 @@ static void read_symbols(char *modname)
 	}
 
 	license = get_modinfo(info.modinfo, info.modinfo_len, "license");
+	if (!license && !is_vmlinux(modname))
+		warn("modpost: missing MODULE_LICENSE() in %s\n", modname);
 	while (license) {
 		if (license_is_gpl_compatible(license))
 			mod->gpl_compatible = 1;
