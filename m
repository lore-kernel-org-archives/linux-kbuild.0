Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-bn1bn0105.outbound.protection.outlook.com ([157.56.110.105]:20160
	"EHLO na01-bn1-obe.outbound.protection.outlook.com"
	rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
	id S1756381AbbJ2IZE (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 29 Oct 2015 04:25:04 -0400
Date: Thu, 29 Oct 2015 16:07:56 +0800
From: Peter Chen <peter.chen@freescale.com>
Subject: Re: [PATCH 2/3] kbuild: Allow to specify composite modules with
 modname-m
Message-ID: <20151029080745.GC8367@shlinux2>
References: <1446038742-13482-1-git-send-email-mmarek@suse.cz>
 <1446038742-13482-2-git-send-email-mmarek@suse.cz>
 <20151029063427.GB8367@shlinux2>
 <5631D363.2010506@suse.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <5631D363.2010506@suse.cz>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Marek <mmarek@suse.cz>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, daniel.vetter@ffwll.ch, Michal Marek <mmarek@suse.com>, linux-usb@vger.kernel.org, Joern Engel <joern@logfs.org>, Prasad Joshi <prasadjoshi.linux@gmail.com>, logfs@logfs.org

On Thu, Oct 29, 2015 at 09:05:55AM +0100, Michal Marek wrote:
> Dne 29.10.2015 v 07:34 Peter Chen napsal(a):
> > On Wed, Oct 28, 2015 at 02:25:41PM +0100, Michal Marek wrote:
> >> From: Michal Marek <mmarek@suse.com>
> >>
> >> This allows to write
> >>
> >>   drm-$(CONFIG_AGP) += drm_agpsupport.o
> >>
> >> without having to handle CONFIG_AGP=y vs. CONFIG_AGP=m. Only support
> >> this syntax for modules, since built-in code depending on something
> >> modular cannot work and init/Makefile actually relies on the current
> >> semantics. There are a few drivers which adapted to the current
> >> semantics out of necessity; these are fixed to also work when the
> >> respective subsystem is modular.
> >>
> >> Cc: Peter Chen <Peter.Chen@freescale.com>
> >> Cc: linux-usb@vger.kernel.org
> >> Cc: Joern Engel <joern@logfs.org>
> >> Cc: Prasad Joshi <prasadjoshi.linux@gmail.com>
> >> Cc: logfs@logfs.org
> >> Signed-off-by: Michal Marek <mmarek@suse.com>
> >> ---
> >>  drivers/misc/ibmasm/ibmasm.h   | 2 +-
> >>  drivers/usb/chipidea/otg_fsm.h | 2 +-
> >>  fs/logfs/logfs.h               | 2 +-
> >>  scripts/Makefile.build         | 8 ++++++--
> >>  scripts/Makefile.lib           | 4 ++--
> >>  5 files changed, 11 insertions(+), 7 deletions(-)
> >>
> >> diff --git a/drivers/misc/ibmasm/ibmasm.h b/drivers/misc/ibmasm/ibmasm.h
> >> index 9b08344..5bd1277 100644
> >> --- a/drivers/misc/ibmasm/ibmasm.h
> >> +++ b/drivers/misc/ibmasm/ibmasm.h
> >> @@ -211,7 +211,7 @@ void ibmasmfs_unregister(void);
> >>  void ibmasmfs_add_sp(struct service_processor *sp);
> >>  
> >>  /* uart */
> >> -#ifdef CONFIG_SERIAL_8250
> >> +#if IS_ENABLED(CONFIG_SERIAL_8250)
> >>  void ibmasm_register_uart(struct service_processor *sp);
> >>  void ibmasm_unregister_uart(struct service_processor *sp);
> >>  #else
> >> diff --git a/drivers/usb/chipidea/otg_fsm.h b/drivers/usb/chipidea/otg_fsm.h
> >> index 2689375..262d6ef 100644
> >> --- a/drivers/usb/chipidea/otg_fsm.h
> >> +++ b/drivers/usb/chipidea/otg_fsm.h
> >> @@ -62,7 +62,7 @@
> >>  /* SSEND time before SRP */
> >>  #define TB_SSEND_SRP         (1500)	/* minimum 1.5 sec, section:5.1.2 */
> >>  
> >> -#ifdef CONFIG_USB_OTG_FSM
> >> +#if IS_ENABLED(CONFIG_USB_OTG_FSM)
> > 
> > Does it mean if the configuration is tristate, it must use IS_ENABLED?
> 
> IS_ENABLED is a shortcut for defined(CONFIG_FOO) ||
> defined(CONFIG_FOO_MODULE). In other words, it makes sure the that otg
> fsm functions are used for both CONFIG_USB_OTG_FSM=y and
> CONFIG_USB_OTG_FSM=m.
> 
> Michal
> 

For chipidea changes:
Acked-by: Peter Chen <peter.chen@freescale.com>

-- 

Best Regards,
Peter Chen
