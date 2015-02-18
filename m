Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:39254 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751787AbbBRVdp (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 18 Feb 2015 16:33:45 -0500
Date: Wed, 18 Feb 2015 22:33:43 +0100
From: Michal Marek <mmarek@suse.cz>
Subject: [GIT PULL] kconfig changes for v3.20-rc1
Message-ID: <20150218213342.GA28352@pobox.suse.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: cj@linux.com, colin.king@canonical.com, olof@lixom.net, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org

Hi Linus,

Yann E. Morin was supposed to take over kconfig maintainership, but this
hasn't happened. So I'm sending a few kconfig patches that I collected
for v3.20-rc1:

- Fix for missing va_end in kconfig
- merge_config.sh displays used if given too few arguments
- s/boolean/bool/ in Kconfig files for consistency, with the plan to
  only support bool in the future.

Michal

The following changes since commit 97bf6af1f928216fd6c5a66e8a57bfa95a659672:

  Linux 3.19-rc1 (2014-12-20 17:08:50 -0800)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/mmarek/kbuild.git kconfig

for you to fetch changes up to b6a2ab2cd4739a9573ed41677e53171987b8da34:

  kconfig: use va_end to match corresponding va_start (2015-01-27 16:52:43 +0100)

----------------------------------------------------------------
Christoph Jaeger (1):
      kconfig: use bool instead of boolean for type definition attributes

Colin Ian King (1):
      kconfig: use va_end to match corresponding va_start

Olof Johansson (1):
      merge_config.sh: Display usage if given too few arguments

 arch/mips/pmcs-msp71xx/Kconfig      |  6 +++---
 drivers/connector/Kconfig           |  2 +-
 drivers/hwmon/Kconfig               |  2 +-
 drivers/hwmon/pmbus/Kconfig         |  2 +-
 drivers/i2c/Kconfig                 |  4 ++--
 drivers/iio/Kconfig                 |  4 ++--
 drivers/isdn/hardware/mISDN/Kconfig |  2 +-
 drivers/md/Kconfig                  |  4 ++--
 drivers/md/persistent-data/Kconfig  |  2 +-
 drivers/net/ethernet/ti/Kconfig     |  4 ++--
 drivers/net/usb/Kconfig             | 12 ++++++------
 drivers/net/wireless/rt2x00/Kconfig |  6 +++---
 drivers/pci/pcie/aer/Kconfig        |  2 +-
 drivers/rtc/Kconfig                 |  8 ++++----
 drivers/spi/Kconfig                 |  6 +++---
 drivers/staging/board/Kconfig       |  2 +-
 drivers/staging/emxx_udc/Kconfig    |  2 +-
 drivers/staging/iio/Kconfig         |  4 ++--
 drivers/tty/serial/Kconfig          |  2 +-
 drivers/usb/gadget/Kconfig          | 34 +++++++++++++++++-----------------
 drivers/usb/gadget/legacy/Kconfig   |  2 +-
 drivers/usb/gadget/udc/Kconfig      |  4 ++--
 drivers/usb/phy/Kconfig             |  2 +-
 init/Kconfig                        |  4 ++--
 lib/Kconfig                         | 30 +++++++++++++++---------------
 mm/Kconfig                          | 22 +++++++++++-----------
 net/Kconfig                         | 14 +++++++-------
 net/sched/Kconfig                   |  2 +-
 net/switchdev/Kconfig               |  2 +-
 scripts/kconfig/confdata.c          |  1 +
 scripts/kconfig/merge_config.sh     |  5 +++++
 security/integrity/Kconfig          |  4 ++--
 security/integrity/evm/Kconfig      |  2 +-
 33 files changed, 105 insertions(+), 99 deletions(-)
