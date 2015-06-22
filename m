Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mout.kundenserver.de ([212.227.17.13]:58799 "EHLO
	mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751604AbbFVRDR (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 22 Jun 2015 13:03:17 -0400
Date: Mon, 22 Jun 2015 19:03:01 +0200
From: Karsten Merker <merker@debian.org>
Subject: Re: [PATCH] kbuild: builddeb: Include dtbs in the Debian package
 built by "make deb-pkg"
Message-ID: <20150622170301.GA1773@excalibur.cnev.de>
References: <1434811689-6923-1-git-send-email-merker@debian.org>
 <CAAqcGH=+NFPLifxXy58QytE2ndpQC2sj3_xkHe8405oZLkk3WQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAAqcGH=+NFPLifxXy58QytE2ndpQC2sj3_xkHe8405oZLkk3WQ@mail.gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Riku Voipio <riku.voipio@linaro.org>
Cc: Karsten Merker <merker@debian.org>, Michal Marek <mmarek@suse.cz>, linux-kbuild <linux-kbuild@vger.kernel.org>

On Mon, Jun 22, 2015 at 09:04:43AM +0300, Riku Voipio wrote:
> On 20 June 2015 at 17:48, Karsten Merker <merker@debian.org> wrote:
> > Native Debian kernel packages include any dtbs that were generated
> > during the kernel build process in /usr/lib/${packagename}.
> > Do the same for Debian packages built by scripts/package/builddeb
> > (executed by the "deb-pkg" target).
> 
> This change has already been submitted in a few variations and is now
> headed to next kernel version:
> 
> https://git.kernel.org/cgit/linux/kernel/git/mmarek/kbuild.git/commit/?h=misc&id=ca2a9d2cf6cf3dd852c3926ac7e30ee774da4638

Ooops - sorry for the noise...

Regards,
Karsten
-- 
Gem. Par. 28 Abs. 4 Bundesdatenschutzgesetz widerspreche ich der Nutzung
sowie der Weitergabe meiner personenbezogenen Daten für Zwecke der
Werbung sowie der Markt- oder Meinungsforschung.
--
To unsubscribe from this list: send the line "unsubscribe linux-kbuild" in
