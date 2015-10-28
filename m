Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mx2.suse.de ([195.135.220.15]:60436 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752275AbbJ1NZ5 (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 28 Oct 2015 09:25:57 -0400
From: Michal Marek <mmarek@suse.cz>
Subject: [PATCH 1/3] staging/ad7606: Actually build the interface modules
Date: Wed, 28 Oct 2015 14:25:40 +0100
Message-Id: <1446038742-13482-1-git-send-email-mmarek@suse.cz>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, daniel.vetter@ffwll.ch, Michal Marek <mmarek@suse.com>, Michael Hennerich <Michael.Hennerich@analog.com>, Lars-Peter Clausen <lars@metafoo.de>

From: Michal Marek <mmarek@suse.com>

The ad7606_par and ad7606_spi drivers are not built if CONFIG_AD7606=m,
because kbuild does not currently support <objname>-m syntax. Even if we
add kbuild support, ad7606 fails to link, because of duplicate
module_init definitions. Make the two drivers separate modules, as the
Kconfig help text already suggests.

Also, CONFIG_IIO_BUFFER is a dependency of CONFIG_AD7606, so there is no
need to test for it in the Makefile.

Cc: Michael Hennerich <Michael.Hennerich@analog.com>
Cc: Lars-Peter Clausen <lars@metafoo.de>
Signed-off-by: Michal Marek <mmarek@suse.com>
---
 drivers/staging/iio/adc/Kconfig       | 4 ++--
 drivers/staging/iio/adc/Makefile      | 7 +++----
 drivers/staging/iio/adc/ad7606_core.c | 4 ++++
 3 files changed, 9 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/iio/adc/Kconfig b/drivers/staging/iio/adc/Kconfig
index 94ae423..58d4517 100644
--- a/drivers/staging/iio/adc/Kconfig
+++ b/drivers/staging/iio/adc/Kconfig
@@ -23,7 +23,7 @@ config AD7606_IFACE_PARALLEL
 	  ADC driver.
 
 	  To compile this driver as a module, choose M here: the
-	  module will be called ad7606_iface_parallel.
+	  module will be called ad7606_parallel.
 
 config AD7606_IFACE_SPI
 	tristate "spi interface support"
@@ -34,7 +34,7 @@ config AD7606_IFACE_SPI
 	  ADC driver.
 
 	  To compile this driver as a module, choose M here: the
-	  module will be called ad7606_iface_spi.
+	  module will be called ad7606_spi.
 
 config AD7780
 	tristate "Analog Devices AD7780 and similar ADCs driver"
diff --git a/drivers/staging/iio/adc/Makefile b/drivers/staging/iio/adc/Makefile
index 1c4277d..0c87ce3 100644
--- a/drivers/staging/iio/adc/Makefile
+++ b/drivers/staging/iio/adc/Makefile
@@ -2,10 +2,9 @@
 # Makefile for industrial I/O ADC drivers
 #
 
-ad7606-y := ad7606_core.o
-ad7606-$(CONFIG_IIO_BUFFER) += ad7606_ring.o
-ad7606-$(CONFIG_AD7606_IFACE_PARALLEL) += ad7606_par.o
-ad7606-$(CONFIG_AD7606_IFACE_SPI) += ad7606_spi.o
+ad7606-y := ad7606_core.o ad7606_ring.o
+obj-$(CONFIG_AD7606_IFACE_PARALLEL) += ad7606_par.o
+obj-$(CONFIG_AD7606_IFACE_SPI) += ad7606_spi.o
 obj-$(CONFIG_AD7606) += ad7606.o
 
 obj-$(CONFIG_AD7780) += ad7780.o
diff --git a/drivers/staging/iio/adc/ad7606_core.c b/drivers/staging/iio/adc/ad7606_core.c
index 5796ed2..2c9d8b7 100644
--- a/drivers/staging/iio/adc/ad7606_core.c
+++ b/drivers/staging/iio/adc/ad7606_core.c
@@ -559,6 +559,7 @@ error_disable_reg:
 		regulator_disable(st->reg);
 	return ERR_PTR(ret);
 }
+EXPORT_SYMBOL_GPL(ad7606_probe);
 
 int ad7606_remove(struct iio_dev *indio_dev, int irq)
 {
@@ -575,6 +576,7 @@ int ad7606_remove(struct iio_dev *indio_dev, int irq)
 
 	return 0;
 }
+EXPORT_SYMBOL_GPL(ad7606_remove);
 
 void ad7606_suspend(struct iio_dev *indio_dev)
 {
@@ -586,6 +588,7 @@ void ad7606_suspend(struct iio_dev *indio_dev)
 		gpio_set_value(st->pdata->gpio_stby, 0);
 	}
 }
+EXPORT_SYMBOL_GPL(ad7606_suspend);
 
 void ad7606_resume(struct iio_dev *indio_dev)
 {
@@ -600,6 +603,7 @@ void ad7606_resume(struct iio_dev *indio_dev)
 		ad7606_reset(st);
 	}
 }
+EXPORT_SYMBOL_GPL(ad7606_resume);
 
 MODULE_AUTHOR("Michael Hennerich <hennerich@blackfin.uclinux.org>");
 MODULE_DESCRIPTION("Analog Devices AD7606 ADC");
-- 
1.9.2

