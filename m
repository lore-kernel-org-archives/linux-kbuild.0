Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail.free-electrons.com ([94.23.35.102]:59124 "EHLO
	mail.free-electrons.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753005Ab3B0UlH (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 27 Feb 2013 15:41:07 -0500
Date: Wed, 27 Feb 2013 21:41:02 +0100
From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Subject: randconfig bug when used with KCONFIG_ALLCONFIG
Message-ID: <20130227214102.6d63544d@skate>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org, Michal Marek <mmarek@suse.cz>

Hello,

I'd like to report that the randconfig code seems to have a bug when it
is given a set of fixed values using KCONFIG_ALLCONFIG: it forgets to
randomize choice values.

Take the following Config.test.in:

-----8<----------8<------------8<----------
config OPTIONA
       bool "Option A"

choice
	prompt "This is a choice"

config CHOICE_OPTIONA
	bool "Choice Option A"

config CHOICE_OPTIONB
	bool "Choice Option B"

endchoice

config OPTIONB
       bool "Option B"
-----8<----------8<------------8<----------

If you do (using the kernel's kconfig):

 ./scripts/kconfig/conf --randconfig Config.test.in

you will see that the generated .config file properly randomizes all
options, including CHOICE_OPTIONA and CHOICE_OPTIONB.

Now, if we create a partial .config (named orig.config) file to set
the value of some options:

-----8<----------8<------------8<----------
CONFIG_OPTIONA=y
-----8<----------8<------------8<----------

If you do:

 KCONFIG_ALLCONFIG=orig.config ./scripts/kconfig/conf --randconfig Config.test.in

and look at the resulting .config, you will see that:

 * CONFIG_OPTIONA is always set to y, which is OK.

 * CONFIG_OPTIONB is properly randomized

 * But in the choice, it's always CONFIG_CHOICE_OPTIONA that will be
   selected, and never CONFIG_CHOICE_OPTIONB. The randomization for
   choices doesn't work as soon as a file is passed as
   KCONFIG_ALLCONFIG.

As you can see, the randomization of choices does not work properly
when KCONFIG_ALLCONFIG is used.

I've looked a little bit in the code, and in the following piece of
code from confdata.c:

	for_all_symbols(i, csym) {
		if (sym_has_value(csym) || !sym_is_choice(csym))
			continue;

		sym_calc_value(csym);
		if (mode == def_random)
			randomize_choice_values(csym);
		else
			set_all_choice_values(csym);
	}

which is normally responsible for randomizing choice values,
sym_has_value(csym) returns true for all choice options when
KCONFIG_ALLCONFIG is used, which explains why the choices are not
randomized. I haven't found out though why the kconfig code thinks that
all choice values already have a value, even though no value has been
passed through the KCONFIG_ALLCONFIG file.

Any hints? Or patch to test?

Thanks,

Thomas Petazzoni
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
