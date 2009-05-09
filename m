Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail.gmx.net ([213.165.64.20]:58841 "HELO mail.gmx.net"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with SMTP
	id S1751167AbZEIQNH (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Sat, 9 May 2009 12:13:07 -0400
Date: Sat, 9 May 2009 18:13:13 +0200 (CEST)
From: Guennadi Liakhovetski <g.liakhovetski@gmx.de>
Subject: dubious section mismatch test (was Re: [PULL] soc-camera: one commit
 as v4l2-dev preparation)
In-Reply-To: <20090509062726.22d18182@pedra.chehab.org>
Message-ID: <Pine.LNX.4.64.0905091430100.3515@axis700.grange>
References: <Pine.LNX.4.64.0905071841331.9460@axis700.grange>
 <20090509062726.22d18182@pedra.chehab.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Mauro Carvalho Chehab <mchehab@infradead.org>
Cc: Linux Media Mailing List <linux-media@vger.kernel.org>, linux-kernel@vger.kernel.org, sam@ravnborg.org, linux-kbuild@vger.kernel.org

On Sat, 9 May 2009, Mauro Carvalho Chehab wrote:

> WARNING: /home/v4l/master/v4l/soc_camera.o(.data+0x0): Section mismatch in reference from the variable soc_camera_pdrv to the function .devinit.text:soc_camera_pdrv_probe()
> The variable soc_camera_pdrv references
> the function __devinit soc_camera_pdrv_probe()
> If the reference is valid then annotate the
> variable with __init* (see linux/init.h) or name the variable:
> *driver, *_template, *_timer, *_sht, *_ops, *_probe, *_probe_one, *_console, 
> 
> WARNING: /home/v4l/master/v4l/soc_camera.o(.data+0x8): Section mismatch in reference from the variable soc_camera_pdrv to the function .devexit.text:soc_camera_pdrv_remove()
> The variable soc_camera_pdrv references
> the function __devexit soc_camera_pdrv_remove()
> If the reference is valid then annotate the
> variable with __exit* (see linux/init.h) or name the variable:
> *driver, *_template, *_timer, *_sht, *_ops, *_probe, *_probe_one, *_console, 

FWIW, I find this test dubious. Matching on symbol names doesn't seem like 
a good idea to me. Can we introduce a new marker instead something like

static struct whatever_driver __driver driver = {
	.probe	= my_probe,
	.remove	= __exit_p(my_remove),
};

to put them in a new special section? Or is there a better solution?

Thanks
Guennadi
---
Guennadi Liakhovetski, Ph.D.
Freelance Open-Source Software Developer
http://www.open-technology.de/
