Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from server159.web-hosting.com ([68.65.120.118]:57112 "EHLO
	s159.web-hosting.com" rhost-flags-OK-FAIL-OK-OK) by vger.kernel.org
	with ESMTP id S1752037AbcBOUh0 (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 15 Feb 2016 15:37:26 -0500
Received: from mail-lb0-f178.google.com ([209.85.217.178]:34478)
	by server159.web-hosting.com with esmtpsa (TLSv1.2:AES128-GCM-SHA256:128)
	(Exim 4.86)
	(envelope-from <jteki@openedev.com>)
	id 1aVO4u-002HL7-BB
	for linux-kbuild@vger.kernel.org; Mon, 15 Feb 2016 13:40:57 -0500
Received: by mail-lb0-f178.google.com with SMTP id ut4so7098077lbc.1
        for <linux-kbuild@vger.kernel.org>; Mon, 15 Feb 2016 10:40:56 -0800 (PST)
MIME-Version: 1.0
Date: Tue, 16 Feb 2016 00:10:54 +0530
Message-ID: <CAD6G_RRNi2BzVdCeqOLc=-taaiQRs2NRxtaNC1FjHT35MeFEdw@mail.gmail.com>
Subject: Kconfig 'select' forcing config selecting even if dependent undefined
From: Jagan Teki <jteki@openedev.com>
Content-Type: text/plain; charset=UTF-8
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org

Hi,

This is my kconfig file.

config MTD_SPI_NOR
      tristate "SPI-NOR support"
      select HAVE_MTD_SPI_NOR
      help

config HAVE_MTD_SPI_NOR
     tristate
     depends on SPI_MASTER

My intention was not to add extra config HAVE_MTD_SPI_NOR on
individual defconfigs. So  MTD_SPI_NOR is selecting HAVE_MTD_SPI_NOR
and there HAVE_MTD_SPI_NOR is depends on SPI_MASTER config.

1) HAVE_MTD_SPI_NOR will select If SPI_MASTER defined
2) HAVE_MTD_SPI_NOR will un-select if SPI_MASTER undefined

case 2) here is forcing HAVE_MTD_SPI_NOR selecting even if SPI_MASTER
is undefined, any idea how to fix this? I saw the Linux
Documentation/kbuild/kconfig-language.txt have similar issue with
"Adding common features and make the usage configurable" but couldn't
find any solution.

thanks!
-- 
Jagan.
