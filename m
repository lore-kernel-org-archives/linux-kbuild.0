Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from services.gouders.net ([141.101.32.176]:48907 "EHLO
	services.gouders.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754126AbcDTNV1 convert rfc822-to-8bit (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 20 Apr 2016 09:21:27 -0400
From: Dirk Gouders <dirk@gouders.net>
Subject: Re: [RESEND PATCH v4] kconfig/symbol.c: handle choice_values that depend on 'm' symbols
In-Reply-To: <201604201924.7peNMcCF%fengguang.wu@intel.com> (kbuild test
	robot's message of "Wed, 20 Apr 2016 19:04:42 +0800")
References: <201604201924.7peNMcCF%fengguang.wu@intel.com>
Date: Wed, 20 Apr 2016 15:14:38 +0200
Message-ID: <ghega0bewx.fsf@lena.gouders.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8BIT
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Marek <mmarek@suse.cz>
Cc: kbuild-all@01.org, Roger Quadros <rogerq@ti.com>, Ruslan Bilovol <ruslan.bilovol@gmail.com>, Bin Liu <binmlist@gmail.com>, Sebastian Andrzej Siewior <bigeasy@linutronix.de>, linux-kbuild@vger.kernel.org, USB list <linux-usb@vger.kernel.org>, Tomi Valkeinen <tomi.valkeinen@ti.com>

kbuild test robot <lkp@intel.com> writes:

> Hi,
>
> [auto build test ERROR on v4.6-rc4]
> [also build test ERROR on next-20160420]
> [if your patch is applied to the wrong git tree, please drop us a note to help improving the system]
>
> url:    https://github.com/0day-ci/linux/commits/Dirk-Gouders/kconfig-symbol-c-handle-choice_values-that-depend-on-m-symbols/20160420-182514
> config: i386-randconfig-i0-201616 (attached as .config)
> reproduce:
>         # save the attached .config to linux build tree
>         make ARCH=i386 

This problem is because, with this patch we now get a Problem if choices
are all boolean and all of them depend on a symbol set to 'm'.  In this
case none of the choices can be other than 'n'.  I'm not sure if we want
such a behavior.

In the case of dbgp we could probably fix the Kconfig file by removing
the dependency from the default choice (the choices are surrounded by
"if USB_G_DBGP", anyway).

Suggestions are very welcome.

Dirk

> All errors (new ones prefixed by >>):
>
>    drivers/usb/gadget/legacy/dbgp.c: In function 'dbgp_disconnect':
>>> drivers/usb/gadget/legacy/dbgp.c:213:25: error: 'struct dbgp' has no member named 'serial'
>      gserial_disconnect(dbgp.serial);
>                             ^
>    drivers/usb/gadget/legacy/dbgp.c: In function 'dbgp_setup':
>    drivers/usb/gadget/legacy/dbgp.c:374:29: error: 'struct dbgp' has no member named 'serial'
>       err = gserial_connect(dbgp.serial, tty_line);
>                                 ^
>>> drivers/usb/gadget/legacy/dbgp.c:374:38: error: 'tty_line' undeclared (first use in this function)
>       err = gserial_connect(dbgp.serial, tty_line);
>                                          ^
>    drivers/usb/gadget/legacy/dbgp.c:374:38: note: each undeclared identifier is reported only once for each function it appears in
>
> vim +213 drivers/usb/gadget/legacy/dbgp.c
>
> f6c826a9 drivers/usb/gadget/dbgp.c        stephane duverger         2010-07-12  207  
> f6c826a9 drivers/usb/gadget/dbgp.c        stephane duverger         2010-07-12  208  static void dbgp_disconnect(struct usb_gadget *gadget)
> f6c826a9 drivers/usb/gadget/dbgp.c        stephane duverger         2010-07-12  209  {
> f6c826a9 drivers/usb/gadget/dbgp.c        stephane duverger         2010-07-12  210  #ifdef CONFIG_USB_G_DBGP_PRINTK
> f6c826a9 drivers/usb/gadget/dbgp.c        stephane duverger         2010-07-12  211  	dbgp_disable_ep();
> f6c826a9 drivers/usb/gadget/dbgp.c        stephane duverger         2010-07-12  212  #else
> f6c826a9 drivers/usb/gadget/dbgp.c        stephane duverger         2010-07-12 @213  	gserial_disconnect(dbgp.serial);
> f6c826a9 drivers/usb/gadget/dbgp.c        stephane duverger         2010-07-12  214  #endif
> f6c826a9 drivers/usb/gadget/dbgp.c        stephane duverger         2010-07-12  215  }
> f6c826a9 drivers/usb/gadget/dbgp.c        stephane duverger         2010-07-12  216  
> f6c826a9 drivers/usb/gadget/dbgp.c        stephane duverger         2010-07-12  217  static void dbgp_unbind(struct usb_gadget *gadget)
> f6c826a9 drivers/usb/gadget/dbgp.c        stephane duverger         2010-07-12  218  {
> f6c826a9 drivers/usb/gadget/dbgp.c        stephane duverger         2010-07-12  219  #ifdef CONFIG_USB_G_DBGP_SERIAL
> f6c826a9 drivers/usb/gadget/dbgp.c        stephane duverger         2010-07-12  220  	kfree(dbgp.serial);
> 4958cf32 drivers/usb/gadget/legacy/dbgp.c Alexey Khoroshilov        2014-08-10  221  	dbgp.serial = NULL;
> f6c826a9 drivers/usb/gadget/dbgp.c        stephane duverger         2010-07-12  222  #endif
> f6c826a9 drivers/usb/gadget/dbgp.c        stephane duverger         2010-07-12  223  	if (dbgp.req) {
> f6c826a9 drivers/usb/gadget/dbgp.c        stephane duverger         2010-07-12  224  		kfree(dbgp.req->buf);
> f6c826a9 drivers/usb/gadget/dbgp.c        stephane duverger         2010-07-12  225  		usb_ep_free_request(gadget->ep0, dbgp.req);
> 4958cf32 drivers/usb/gadget/legacy/dbgp.c Alexey Khoroshilov        2014-08-10  226  		dbgp.req = NULL;
> f6c826a9 drivers/usb/gadget/dbgp.c        stephane duverger         2010-07-12  227  	}
> f6c826a9 drivers/usb/gadget/dbgp.c        stephane duverger         2010-07-12  228  }
> f6c826a9 drivers/usb/gadget/dbgp.c        stephane duverger         2010-07-12  229  
> 19b10a88 drivers/usb/gadget/dbgp.c        Sebastian Andrzej Siewior 2012-12-23  230  #ifdef CONFIG_USB_G_DBGP_SERIAL
> 19b10a88 drivers/usb/gadget/dbgp.c        Sebastian Andrzej Siewior 2012-12-23  231  static unsigned char tty_line;
> 19b10a88 drivers/usb/gadget/dbgp.c        Sebastian Andrzej Siewior 2012-12-23  232  #endif
> 19b10a88 drivers/usb/gadget/dbgp.c        Sebastian Andrzej Siewior 2012-12-23  233  
> 6876d58f drivers/usb/gadget/legacy/dbgp.c Kyösti Mälkki             2014-11-03  234  static int dbgp_configure_endpoints(struct usb_gadget *gadget)
> f6c826a9 drivers/usb/gadget/dbgp.c        stephane duverger         2010-07-12  235  {
> f6c826a9 drivers/usb/gadget/dbgp.c        stephane duverger         2010-07-12  236  	int stp;
> f6c826a9 drivers/usb/gadget/dbgp.c        stephane duverger         2010-07-12  237  
> f6c826a9 drivers/usb/gadget/dbgp.c        stephane duverger         2010-07-12  238  	usb_ep_autoconfig_reset(gadget);
> f6c826a9 drivers/usb/gadget/dbgp.c        stephane duverger         2010-07-12  239  
> f6c826a9 drivers/usb/gadget/dbgp.c        stephane duverger         2010-07-12  240  	dbgp.i_ep = usb_ep_autoconfig(gadget, &i_desc);
> f6c826a9 drivers/usb/gadget/dbgp.c        stephane duverger         2010-07-12  241  	if (!dbgp.i_ep) {
> f6c826a9 drivers/usb/gadget/dbgp.c        stephane duverger         2010-07-12  242  		stp = 1;
> f6c826a9 drivers/usb/gadget/dbgp.c        stephane duverger         2010-07-12  243  		goto fail_1;
> f6c826a9 drivers/usb/gadget/dbgp.c        stephane duverger         2010-07-12  244  	}
> f6c826a9 drivers/usb/gadget/dbgp.c        stephane duverger         2010-07-12  245  
> f6c826a9 drivers/usb/gadget/dbgp.c        stephane duverger         2010-07-12  246  	i_desc.wMaxPacketSize =
> b8464bcf drivers/usb/gadget/legacy/dbgp.c Vaishali Thakkar          2015-06-06  247  		cpu_to_le16(USB_DEBUG_MAX_PACKET_SIZE);
> f6c826a9 drivers/usb/gadget/dbgp.c        stephane duverger         2010-07-12  248  
> f6c826a9 drivers/usb/gadget/dbgp.c        stephane duverger         2010-07-12  249  	dbgp.o_ep = usb_ep_autoconfig(gadget, &o_desc);
> f6c826a9 drivers/usb/gadget/dbgp.c        stephane duverger         2010-07-12  250  	if (!dbgp.o_ep) {
> f6c826a9 drivers/usb/gadget/dbgp.c        stephane duverger         2010-07-12  251  		stp = 2;
> 4ce86bfa drivers/usb/gadget/legacy/dbgp.c Robert Baldyga            2015-09-16  252  		goto fail_1;
> f6c826a9 drivers/usb/gadget/dbgp.c        stephane duverger         2010-07-12  253  	}
> f6c826a9 drivers/usb/gadget/dbgp.c        stephane duverger         2010-07-12  254  
> f6c826a9 drivers/usb/gadget/dbgp.c        stephane duverger         2010-07-12  255  	o_desc.wMaxPacketSize =
> b8464bcf drivers/usb/gadget/legacy/dbgp.c Vaishali Thakkar          2015-06-06  256  		cpu_to_le16(USB_DEBUG_MAX_PACKET_SIZE);
> f6c826a9 drivers/usb/gadget/dbgp.c        stephane duverger         2010-07-12  257  
> a8779ee9 drivers/usb/gadget/dbgp.c        Sven Schnelle             2011-03-23  258  	dbg_desc.bDebugInEndpoint = i_desc.bEndpointAddress;
> a8779ee9 drivers/usb/gadget/dbgp.c        Sven Schnelle             2011-03-23  259  	dbg_desc.bDebugOutEndpoint = o_desc.bEndpointAddress;
> f6c826a9 drivers/usb/gadget/dbgp.c        stephane duverger         2010-07-12  260  
> f6c826a9 drivers/usb/gadget/dbgp.c        stephane duverger         2010-07-12  261  #ifdef CONFIG_USB_G_DBGP_SERIAL
> f6c826a9 drivers/usb/gadget/dbgp.c        stephane duverger         2010-07-12  262  	dbgp.serial->in = dbgp.i_ep;
> f6c826a9 drivers/usb/gadget/dbgp.c        stephane duverger         2010-07-12  263  	dbgp.serial->out = dbgp.o_ep;
> f6c826a9 drivers/usb/gadget/dbgp.c        stephane duverger         2010-07-12  264  
> 72c973dd drivers/usb/gadget/dbgp.c        Tatyana Brokhman          2011-06-28  265  	dbgp.serial->in->desc = &i_desc;
> 72c973dd drivers/usb/gadget/dbgp.c        Tatyana Brokhman          2011-06-28  266  	dbgp.serial->out->desc = &o_desc;
> 6876d58f drivers/usb/gadget/legacy/dbgp.c Kyösti Mälkki             2014-11-03  267  #endif
> f6c826a9 drivers/usb/gadget/dbgp.c        stephane duverger         2010-07-12  268  
> f6c826a9 drivers/usb/gadget/dbgp.c        stephane duverger         2010-07-12  269  	return 0;
> f6c826a9 drivers/usb/gadget/dbgp.c        stephane duverger         2010-07-12  270  
> f6c826a9 drivers/usb/gadget/dbgp.c        stephane duverger         2010-07-12  271  fail_1:
> f6c826a9 drivers/usb/gadget/dbgp.c        stephane duverger         2010-07-12  272  	dev_dbg(&dbgp.gadget->dev, "ep config: failure (%d)\n", stp);
> f6c826a9 drivers/usb/gadget/dbgp.c        stephane duverger         2010-07-12  273  	return -ENODEV;
> f6c826a9 drivers/usb/gadget/dbgp.c        stephane duverger         2010-07-12  274  }
> f6c826a9 drivers/usb/gadget/dbgp.c        stephane duverger         2010-07-12  275  
> c94e289f drivers/usb/gadget/legacy/dbgp.c Arnd Bergmann             2015-04-11  276  static int dbgp_bind(struct usb_gadget *gadget,
> ffe0b335 drivers/usb/gadget/dbgp.c        Sebastian Andrzej Siewior 2012-09-07  277  		struct usb_gadget_driver *driver)
> f6c826a9 drivers/usb/gadget/dbgp.c        stephane duverger         2010-07-12  278  {
> f6c826a9 drivers/usb/gadget/dbgp.c        stephane duverger         2010-07-12  279  	int err, stp;
> f6c826a9 drivers/usb/gadget/dbgp.c        stephane duverger         2010-07-12  280  
> f6c826a9 drivers/usb/gadget/dbgp.c        stephane duverger         2010-07-12  281  	dbgp.gadget = gadget;
> f6c826a9 drivers/usb/gadget/dbgp.c        stephane duverger         2010-07-12  282  
> f6c826a9 drivers/usb/gadget/dbgp.c        stephane duverger         2010-07-12  283  	dbgp.req = usb_ep_alloc_request(gadget->ep0, GFP_KERNEL);
> f6c826a9 drivers/usb/gadget/dbgp.c        stephane duverger         2010-07-12  284  	if (!dbgp.req) {
> f6c826a9 drivers/usb/gadget/dbgp.c        stephane duverger         2010-07-12  285  		err = -ENOMEM;
> f6c826a9 drivers/usb/gadget/dbgp.c        stephane duverger         2010-07-12  286  		stp = 1;
> f6c826a9 drivers/usb/gadget/dbgp.c        stephane duverger         2010-07-12  287  		goto fail;
> f6c826a9 drivers/usb/gadget/dbgp.c        stephane duverger         2010-07-12  288  	}
> f6c826a9 drivers/usb/gadget/dbgp.c        stephane duverger         2010-07-12  289  
> f6c826a9 drivers/usb/gadget/dbgp.c        stephane duverger         2010-07-12  290  	dbgp.req->buf = kmalloc(DBGP_REQ_EP0_LEN, GFP_KERNEL);
> f6c826a9 drivers/usb/gadget/dbgp.c        stephane duverger         2010-07-12  291  	if (!dbgp.req->buf) {
> f6c826a9 drivers/usb/gadget/dbgp.c        stephane duverger         2010-07-12  292  		err = -ENOMEM;
> f6c826a9 drivers/usb/gadget/dbgp.c        stephane duverger         2010-07-12  293  		stp = 2;
> f6c826a9 drivers/usb/gadget/dbgp.c        stephane duverger         2010-07-12  294  		goto fail;
> f6c826a9 drivers/usb/gadget/dbgp.c        stephane duverger         2010-07-12  295  	}
> f6c826a9 drivers/usb/gadget/dbgp.c        stephane duverger         2010-07-12  296  
> f6c826a9 drivers/usb/gadget/dbgp.c        stephane duverger         2010-07-12  297  	dbgp.req->length = DBGP_REQ_EP0_LEN;
> f6c826a9 drivers/usb/gadget/dbgp.c        stephane duverger         2010-07-12  298  
> f6c826a9 drivers/usb/gadget/dbgp.c        stephane duverger         2010-07-12  299  #ifdef CONFIG_USB_G_DBGP_SERIAL
> f6c826a9 drivers/usb/gadget/dbgp.c        stephane duverger         2010-07-12  300  	dbgp.serial = kzalloc(sizeof(struct gserial), GFP_KERNEL);
> f6c826a9 drivers/usb/gadget/dbgp.c        stephane duverger         2010-07-12  301  	if (!dbgp.serial) {
> f6c826a9 drivers/usb/gadget/dbgp.c        stephane duverger         2010-07-12  302  		stp = 3;
> f6c826a9 drivers/usb/gadget/dbgp.c        stephane duverger         2010-07-12  303  		err = -ENOMEM;
> f6c826a9 drivers/usb/gadget/dbgp.c        stephane duverger         2010-07-12  304  		goto fail;
> f6c826a9 drivers/usb/gadget/dbgp.c        stephane duverger         2010-07-12  305  	}
> 6876d58f drivers/usb/gadget/legacy/dbgp.c Kyösti Mälkki             2014-11-03  306  
> 6876d58f drivers/usb/gadget/legacy/dbgp.c Kyösti Mälkki             2014-11-03  307  	if (gserial_alloc_line(&tty_line)) {
> 6876d58f drivers/usb/gadget/legacy/dbgp.c Kyösti Mälkki             2014-11-03  308  		stp = 4;
> 6876d58f drivers/usb/gadget/legacy/dbgp.c Kyösti Mälkki             2014-11-03  309  		err = -ENODEV;
> 6876d58f drivers/usb/gadget/legacy/dbgp.c Kyösti Mälkki             2014-11-03  310  		goto fail;
> 6876d58f drivers/usb/gadget/legacy/dbgp.c Kyösti Mälkki             2014-11-03  311  	}
> f6c826a9 drivers/usb/gadget/dbgp.c        stephane duverger         2010-07-12  312  #endif
> 6876d58f drivers/usb/gadget/legacy/dbgp.c Kyösti Mälkki             2014-11-03  313  
> f6c826a9 drivers/usb/gadget/dbgp.c        stephane duverger         2010-07-12  314  	err = dbgp_configure_endpoints(gadget);
> f6c826a9 drivers/usb/gadget/dbgp.c        stephane duverger         2010-07-12  315  	if (err < 0) {
> 6876d58f drivers/usb/gadget/legacy/dbgp.c Kyösti Mälkki             2014-11-03  316  		stp = 5;
> f6c826a9 drivers/usb/gadget/dbgp.c        stephane duverger         2010-07-12  317  		goto fail;
> f6c826a9 drivers/usb/gadget/dbgp.c        stephane duverger         2010-07-12  318  	}
> f6c826a9 drivers/usb/gadget/dbgp.c        stephane duverger         2010-07-12  319  
> f6c826a9 drivers/usb/gadget/dbgp.c        stephane duverger         2010-07-12  320  	dev_dbg(&dbgp.gadget->dev, "bind: success\n");
> f6c826a9 drivers/usb/gadget/dbgp.c        stephane duverger         2010-07-12  321  	return 0;
> f6c826a9 drivers/usb/gadget/dbgp.c        stephane duverger         2010-07-12  322  
> f6c826a9 drivers/usb/gadget/dbgp.c        stephane duverger         2010-07-12  323  fail:
> f6c826a9 drivers/usb/gadget/dbgp.c        stephane duverger         2010-07-12  324  	dev_dbg(&gadget->dev, "bind: failure (%d:%d)\n", stp, err);
> f6c826a9 drivers/usb/gadget/dbgp.c        stephane duverger         2010-07-12  325  	dbgp_unbind(gadget);
> f6c826a9 drivers/usb/gadget/dbgp.c        stephane duverger         2010-07-12  326  	return err;
> f6c826a9 drivers/usb/gadget/dbgp.c        stephane duverger         2010-07-12  327  }
> f6c826a9 drivers/usb/gadget/dbgp.c        stephane duverger         2010-07-12  328  
> f6c826a9 drivers/usb/gadget/dbgp.c        stephane duverger         2010-07-12  329  static void dbgp_setup_complete(struct usb_ep *ep,
> f6c826a9 drivers/usb/gadget/dbgp.c        stephane duverger         2010-07-12  330  				struct usb_request *req)
> f6c826a9 drivers/usb/gadget/dbgp.c        stephane duverger         2010-07-12  331  {
> f6c826a9 drivers/usb/gadget/dbgp.c        stephane duverger         2010-07-12  332  	dev_dbg(&dbgp.gadget->dev, "setup complete: %d, %d/%d\n",
> f6c826a9 drivers/usb/gadget/dbgp.c        stephane duverger         2010-07-12  333  		req->status, req->actual, req->length);
> f6c826a9 drivers/usb/gadget/dbgp.c        stephane duverger         2010-07-12  334  }
> f6c826a9 drivers/usb/gadget/dbgp.c        stephane duverger         2010-07-12  335  
> f6c826a9 drivers/usb/gadget/dbgp.c        stephane duverger         2010-07-12  336  static int dbgp_setup(struct usb_gadget *gadget,
> f6c826a9 drivers/usb/gadget/dbgp.c        stephane duverger         2010-07-12  337  		      const struct usb_ctrlrequest *ctrl)
> f6c826a9 drivers/usb/gadget/dbgp.c        stephane duverger         2010-07-12  338  {
> f6c826a9 drivers/usb/gadget/dbgp.c        stephane duverger         2010-07-12  339  	struct usb_request *req = dbgp.req;
> f6c826a9 drivers/usb/gadget/dbgp.c        stephane duverger         2010-07-12  340  	u8 request = ctrl->bRequest;
> f6c826a9 drivers/usb/gadget/dbgp.c        stephane duverger         2010-07-12  341  	u16 value = le16_to_cpu(ctrl->wValue);
> f6c826a9 drivers/usb/gadget/dbgp.c        stephane duverger         2010-07-12  342  	u16 length = le16_to_cpu(ctrl->wLength);
> 1744020c drivers/usb/gadget/dbgp.c        Sven Schnelle             2011-03-23  343  	int err = -EOPNOTSUPP;
> 1744020c drivers/usb/gadget/dbgp.c        Sven Schnelle             2011-03-23  344  	void *data = NULL;
> 1744020c drivers/usb/gadget/dbgp.c        Sven Schnelle             2011-03-23  345  	u16 len = 0;
> f6c826a9 drivers/usb/gadget/dbgp.c        stephane duverger         2010-07-12  346  
> f6c826a9 drivers/usb/gadget/dbgp.c        stephane duverger         2010-07-12  347  	if (request == USB_REQ_GET_DESCRIPTOR) {
> f6c826a9 drivers/usb/gadget/dbgp.c        stephane duverger         2010-07-12  348  		switch (value>>8) {
> f6c826a9 drivers/usb/gadget/dbgp.c        stephane duverger         2010-07-12  349  		case USB_DT_DEVICE:
> f6c826a9 drivers/usb/gadget/dbgp.c        stephane duverger         2010-07-12  350  			dev_dbg(&dbgp.gadget->dev, "setup: desc device\n");
> f6c826a9 drivers/usb/gadget/dbgp.c        stephane duverger         2010-07-12  351  			len = sizeof device_desc;
> f6c826a9 drivers/usb/gadget/dbgp.c        stephane duverger         2010-07-12  352  			data = &device_desc;
> 765f5b83 drivers/usb/gadget/dbgp.c        Sebastian Andrzej Siewior 2011-06-23  353  			device_desc.bMaxPacketSize0 = gadget->ep0->maxpacket;
> f6c826a9 drivers/usb/gadget/dbgp.c        stephane duverger         2010-07-12  354  			break;
> f6c826a9 drivers/usb/gadget/dbgp.c        stephane duverger         2010-07-12  355  		case USB_DT_DEBUG:
> f6c826a9 drivers/usb/gadget/dbgp.c        stephane duverger         2010-07-12  356  			dev_dbg(&dbgp.gadget->dev, "setup: desc debug\n");
> f6c826a9 drivers/usb/gadget/dbgp.c        stephane duverger         2010-07-12  357  			len = sizeof dbg_desc;
> f6c826a9 drivers/usb/gadget/dbgp.c        stephane duverger         2010-07-12  358  			data = &dbg_desc;
> f6c826a9 drivers/usb/gadget/dbgp.c        stephane duverger         2010-07-12  359  			break;
> f6c826a9 drivers/usb/gadget/dbgp.c        stephane duverger         2010-07-12  360  		default:
> f6c826a9 drivers/usb/gadget/dbgp.c        stephane duverger         2010-07-12  361  			goto fail;
> f6c826a9 drivers/usb/gadget/dbgp.c        stephane duverger         2010-07-12  362  		}
> 1744020c drivers/usb/gadget/dbgp.c        Sven Schnelle             2011-03-23  363  		err = 0;
> f6c826a9 drivers/usb/gadget/dbgp.c        stephane duverger         2010-07-12  364  	} else if (request == USB_REQ_SET_FEATURE &&
> f6c826a9 drivers/usb/gadget/dbgp.c        stephane duverger         2010-07-12  365  		   value == USB_DEVICE_DEBUG_MODE) {
> f6c826a9 drivers/usb/gadget/dbgp.c        stephane duverger         2010-07-12  366  		dev_dbg(&dbgp.gadget->dev, "setup: feat debug\n");
> f6c826a9 drivers/usb/gadget/dbgp.c        stephane duverger         2010-07-12  367  #ifdef CONFIG_USB_G_DBGP_PRINTK
> f6c826a9 drivers/usb/gadget/dbgp.c        stephane duverger         2010-07-12  368  		err = dbgp_enable_ep();
> f6c826a9 drivers/usb/gadget/dbgp.c        stephane duverger         2010-07-12  369  #else
> 6876d58f drivers/usb/gadget/legacy/dbgp.c Kyösti Mälkki             2014-11-03  370  		err = dbgp_configure_endpoints(gadget);
> 6876d58f drivers/usb/gadget/legacy/dbgp.c Kyösti Mälkki             2014-11-03  371  		if (err < 0) {
> 6876d58f drivers/usb/gadget/legacy/dbgp.c Kyösti Mälkki             2014-11-03  372  			goto fail;
> 6876d58f drivers/usb/gadget/legacy/dbgp.c Kyösti Mälkki             2014-11-03  373  		}
> 19b10a88 drivers/usb/gadget/dbgp.c        Sebastian Andrzej Siewior 2012-12-23 @374  		err = gserial_connect(dbgp.serial, tty_line);
> f6c826a9 drivers/usb/gadget/dbgp.c        stephane duverger         2010-07-12  375  #endif
> f6c826a9 drivers/usb/gadget/dbgp.c        stephane duverger         2010-07-12  376  		if (err < 0)
> f6c826a9 drivers/usb/gadget/dbgp.c        stephane duverger         2010-07-12  377  			goto fail;
>
> :::::: The code at line 213 was first introduced by commit
> :::::: f6c826a90055dd05905982f7a3f60e0bcaa0434e USB: EHCI Debug Port Device Gadget
>
> :::::: TO: stephane duverger <stephane.duverger@gmail.com>
> :::::: CC: Greg Kroah-Hartman <gregkh@suse.de>
>
> ---
> 0-DAY kernel test infrastructure                Open Source Technology Center
> https://lists.01.org/pipermail/kbuild-all                   Intel Corporation
