Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from rcdn-iport-7.cisco.com ([173.37.86.78]:51666 "EHLO
        rcdn-iport-7.cisco.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726169AbeKOIqq (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 15 Nov 2018 03:46:46 -0500
Date: Wed, 14 Nov 2018 14:32:11 -0800
From: Daniel Walker <danielwa@cisco.com>
Subject: hidden string Kconfig ?
Message-ID: <20181114223211.b4a2gjmt5pvtg2bh@zorba>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: linux-kbuild@vger.kernel.org

Hi,


I'm trying to find out if it's possible to have a string in Kconfig which is
hidden from the menu, but still exists in the .config? 

Like,

HIDDEN_STRING
	string

then in the config file there would be,
CONFIG_HIDDEN_STRING="hidden"

and the config option wouldn't be used for anything inside Kconfig. It would
just get set from the .config , or not be set?

The above sample, I've not been able to make work. The string in the .config
gets erased when menuconfig runs.

Any help appreciated.

Daniel
