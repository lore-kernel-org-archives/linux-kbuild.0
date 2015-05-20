Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from relay3-d.mail.gandi.net ([217.70.183.195]:33984 "EHLO
	relay3-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753783AbbETSau (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 20 May 2015 14:30:50 -0400
Date: Wed, 20 May 2015 11:30:42 -0700
From: josh@joshtriplett.org
Subject: Re: [PATCH 4/5] kconfig: Introduce "showif" to factor out
 conditions on visibility
Message-ID: <20150520183042.GA5720@cloud>
References: <e71aeef65671f2b60ce10b0b871585fd2baf850a.1431589089.git.josh@joshtriplett.org>
 <760264ebf529ba3b0aa007144e2862bc73807dad.1431589089.git.josh@joshtriplett.org>
 <1432116013.21715.82.camel@x220>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1432116013.21715.82.camel@x220>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Paul Bolle <pebolle@tiscali.nl>
Cc: Ingo Molnar <mingo@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>, Michal Hocko <mhocko@suse.cz>, Vladimir Davydov <vdavydov@parallels.com>, Johannes Weiner <hannes@cmpxchg.org>, Geert Uytterhoeven <geert@linux-m68k.org>, Andy Lutomirski <luto@amacapital.net>, Bertrand Jacquin <beber@meleeweb.net>, "Luis R. Rodriguez" <mcgrof@suse.com>, Iulia Manda <iulia.manda21@gmail.com>, Pranith Kumar <bobby.prani@gmail.com>, Clark Williams <clark.williams@gmail.com>, Mel Gorman <mgorman@suse.de>, Randy Dunlap <rdunlap@infradead.org>, Michal Marek <mmarek@suse.cz>, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org

On Wed, May 20, 2015 at 12:00:13PM +0200, Paul Bolle wrote:
> Hi Josh,
> 
> On Thu, 2015-05-14 at 08:36 -0700, Josh Triplett wrote:
> > kconfig implicitly creates a submenu whenever a series of symbols all
> > have dependencies or prompt-visibility expressions that all depend on a
> > preceeding symbol. For instance, the series of symbols following
> > "menuconfig EXPERT" that all have "if EXPERT" on their prompt will all
> > appear as a submenu of EXPERT.
> > 
> > However, this implicit submenuing will break if any intervening symbol
> > loses its "if EXPERT"; doing so causes the subsequent symbols to appear
> > in the parent menu ("General setup").  This has happened many times, and
> > it's easy to miss that the entire block should have that same
> > expression.
> > 
> > For submenus created from "depends" dependencies, these can be converted
> > to a single wrapping "if expr ... endif" block around all the submenu
> > items.  However, there's no equivalent for invisible items, for which
> > the prompt is hidden but the symbol may potentially be enabled.  For
> > instance, many items in the EXPERT menu are hidden if EXPERT is
> > disabled, but they have "default y" or are determined by some other
> > expression.
> 
> No one has reacted so far. So my plan to have the other people on
> linux-kbuild do the work here is not going as I'd hoped. Bother...
> 
> I seem to remember that you had a list of three dozen menuconfig
> instances that ran into the same issue as EXPERT's menuconfig. Do you
> still have that list at hand?

I have the command that generated it.  The following will show the next
Kconfig directive after a "menuconfig" entry:

find -name '*Kconfig*' -exec awk 'BEGIN { s=0; } /^menuconfig/ { s=1; sym=$2; next; } s==1 && /^[a-z]/ { print $1, "follows", sym; s=0; } ' {} + | sort

Of those, the following in particular have a "config" directive
following them:

AGP
ARC_CPU_REL_4_10
ARC_DBG
BT
CAIF
DLM
DMADEVICES
DRM
EXPERT
FB
FB_OMAP2
FB_TFT
GENWQE
IEEE802154_DRIVERS
ION
L2TP
MAC80211_DEBUG_MENU
MMC
NFC
PNP
POWER_AVS
PROCESSOR_SELECT
RFKILL
SCSI_DH
SND_SOC_UX500
TIPC
WIMAX
WL1251

A quick survey of those turns up the following that seem like they wanted to
produce a submenu but have dependencies that don't result in a submenu (though
not all of them can use showif, as some use "depends"):

From arch/arc/Kconfig (ARC_CPU_770 selects ARC_CPU_REL_4_10 but that
isn't enough for Kconfig to put the first item under the submenu, so the
subsequent items don't go in the submenu either):

menuconfig ARC_CPU_REL_4_10
        bool "Enable support for Rel 4.10 features"
        default n
        help
          -ARC770 (and dependent features) enabled
          -ARC750 also shares some of the new features with 770

config ARC_HAS_LLSC
        bool "Insn: LLOCK/SCOND (efficient atomic ops)"
        default y
        depends on ARC_CPU_770 && !ARC_CANT_LLSC

config ARC_HAS_SWAPE
        bool "Insn: SWAPE (endian-swap)"
        default y
        depends on ARC_CPU_REL_4_10

config ARC_HAS_RTSC
        bool "Insn: RTSC (64-bit r/o cycle counter)"
        default y
        depends on ARC_CPU_REL_4_10
        depends on !SMP

From drivers/gpu/drm/Kconfig and the files it includes, something in
drivers/gpu/drm/exynos/Kconfig seems to be breaking the DRM menu, such
that subsequent config items (such as DRM_VMWGFX) show up after DRM
rather than under it.  This one could use "if", rather than "showif".

From drivers/video/fbdev/Kconfig:

menuconfig FB
        tristate "Support for frame buffer devices"
        select FB_CMDLINE
        ---help---
[...]

config FIRMWARE_EDID
       bool "Enable firmware EDID"
       depends on FB
       default n
       ---help---
         This enables access to the EDID transferred from the firmware.
         On the i386, this is from the Video BIOS. Enable this if DDC/I2C
         transfers do not work for your driver and if you are using
         nvidiafb, i810fb or savagefb.

         In general, choosing Y for this option is safe.  If you
         experience extremely long delays while booting before you get
         something on your display, try setting this to N.  Matrox cards in
         combination with certain motherboards and monitors are known to
         suffer from this problem.

config FB_CMDLINE
        bool

config FB_DDC
       tristate
       depends on FB
       select I2C_ALGOBIT
       select I2C
       default n

config FB_BOOT_VESA_SUPPORT
        bool
        depends on FB
        default n
        ---help---
          If true, at least one selected framebuffer driver can take advantage
          of VESA video modes set at an early boot stage via the vga= parameter.

[... many more items ...]

That FB_CMDLINE causes all the remaining items to fall out of the FB submenu,
which only contains FIRMWARE_EDID.

PROCESSOR_SELECT looks like it should use showif.

In net/rfkill/Kconfig, RFKILL_REGULATOR oddly has
"depends on RFKILL || !RFKILL".  WIMAX does the same thing.

So, that's several cases that should use "if", at least one more that
should use "showif" (PROCESSOR_SELECT), and several broken menus.

- Josh Triplett
