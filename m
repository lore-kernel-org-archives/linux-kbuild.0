Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([198.137.202.133]:42676 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727724AbfJBXQI (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 2 Oct 2019 19:16:08 -0400
From: Randy Dunlap <rdunlap@infradead.org>
Subject: 'make help' br0ken for @echo ' valid values for SPHINXDIRS are:
 $(_SPHINXDIRS)'
Message-ID: <416a61e8-e40a-6266-3f6a-bdbadf9a10c3@infradead.org>
Date: Wed, 2 Oct 2019 16:16:07 -0700
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild <linux-kbuild@vger.kernel.org>, Jonathan Corbet <corbet@lwn.net>

It seems that _SPHINXDIRS is empty.  I'm getting (short extract):

  make SPHINXDIRS="s1 s2" [target] Generate only docs of folder s1, s2
  valid values for SPHINXDIRS are: 

  make SPHINX_CONF={conf-file} [target] use *additional* sphinx-build
  configuration. This is e.g. useful to build with nit-picking config.

  Default location for the generated documents is Documentation/output


-- 
~Randy
