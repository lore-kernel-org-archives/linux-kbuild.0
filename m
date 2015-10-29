Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mx2.suse.de ([195.135.220.15]:58666 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751447AbbJ2IF7 (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 29 Oct 2015 04:05:59 -0400
Subject: Re: [PATCH 2/3] kbuild: Allow to specify composite modules with
 modname-m
References: <1446038742-13482-1-git-send-email-mmarek@suse.cz>
 <1446038742-13482-2-git-send-email-mmarek@suse.cz>
 <20151029063427.GB8367@shlinux2>
From: Michal Marek <mmarek@suse.cz>
Message-ID: <5631D363.2010506@suse.cz>
Date: Thu, 29 Oct 2015 09:05:55 +0100
MIME-Version: 1.0
In-Reply-To: <20151029063427.GB8367@shlinux2>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Peter Chen <peter.chen@freescale.com>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, daniel.vetter@ffwll.ch, Michal Marek <mmarek@suse.com>, linux-usb@vger.kernel.org, Joern Engel <joern@logfs.org>, Prasad Joshi <prasadjoshi.linux@gmail.com>, logfs@logfs.org

Dne 29.10.2015 v 07:34 Peter Chen napsal(a):
> On Wed, Oct 28, 2015 at 02:25:41PM +0100, Michal Marek wrote:
>> From: Michal Marek <mmarek@suse.com>
>>
>> This allows to write
>>
>>   drm-$(CONFIG_AGP) += drm_agpsupport.o
>>
>> without having to handle CONFIG_AGP=y vs. CONFIG_AGP=m. Only support
>> this syntax for modules, since built-in code depending on something
>> modular cannot work and init/Makefile actually relies on the current
>> semantics. There are a few drivers which adapted to the current
>> semantics out of necessity; these are fixed to also work when the
>> respective subsystem is modular.
>>
>> Cc: Peter Chen <Peter.Chen@freescale.com>
>> Cc: linux-usb@vger.kernel.org
>> Cc: Joern Engel <joern@logfs.org>
>> Cc: Prasad Joshi <prasadjoshi.linux@gmail.com>
>> Cc: logfs@logfs.org
>> Signed-off-by: Michal Marek <mmarek@suse.com>
>> ---
>>  drivers/misc/ibmasm/ibmasm.h   | 2 +-
>>  drivers/usb/chipidea/otg_fsm.h | 2 +-
>>  fs/logfs/logfs.h               | 2 +-
>>  scripts/Makefile.build         | 8 ++++++--
>>  scripts/Makefile.lib           | 4 ++--
>>  5 files changed, 11 insertions(+), 7 deletions(-)
>>
>> diff --git a/drivers/misc/ibmasm/ibmasm.h b/drivers/misc/ibmasm/ibmasm.h
>> index 9b08344..5bd1277 100644
>> --- a/drivers/misc/ibmasm/ibmasm.h
>> +++ b/drivers/misc/ibmasm/ibmasm.h
>> @@ -211,7 +211,7 @@ void ibmasmfs_unregister(void);
>>  void ibmasmfs_add_sp(struct service_processor *sp);
>>  
>>  /* uart */
>> -#ifdef CONFIG_SERIAL_8250
>> +#if IS_ENABLED(CONFIG_SERIAL_8250)
>>  void ibmasm_register_uart(struct service_processor *sp);
>>  void ibmasm_unregister_uart(struct service_processor *sp);
>>  #else
>> diff --git a/drivers/usb/chipidea/otg_fsm.h b/drivers/usb/chipidea/otg_fsm.h
>> index 2689375..262d6ef 100644
>> --- a/drivers/usb/chipidea/otg_fsm.h
>> +++ b/drivers/usb/chipidea/otg_fsm.h
>> @@ -62,7 +62,7 @@
>>  /* SSEND time before SRP */
>>  #define TB_SSEND_SRP         (1500)	/* minimum 1.5 sec, section:5.1.2 */
>>  
>> -#ifdef CONFIG_USB_OTG_FSM
>> +#if IS_ENABLED(CONFIG_USB_OTG_FSM)
> 
> Does it mean if the configuration is tristate, it must use IS_ENABLED?

IS_ENABLED is a shortcut for defined(CONFIG_FOO) ||
defined(CONFIG_FOO_MODULE). In other words, it makes sure the that otg
fsm functions are used for both CONFIG_USB_OTG_FSM=y and
CONFIG_USB_OTG_FSM=m.

Michal

