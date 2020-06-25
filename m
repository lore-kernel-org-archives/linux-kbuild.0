Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-11.nifty.com ([210.131.2.78]:51072 "EHLO
        conuserg-11.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2406413AbgFYRFM (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 25 Jun 2020 13:05:12 -0400
From: Masahiro Yamada <masahiroy@kernel.org>
Subject: [PATCH 0/4] dt-bindings: fix 'make clean' and improve dt-schema check rules
Date: Fri, 26 Jun 2020 02:04:30 +0900
Message-Id: <20200625170434.635114-1-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org
Cc: Frank Rowand <frowand.list@gmail.com>, linux-kbuild@vger.kernel.org, Masahiro Yamada <masahiroy@kernel.org>, Michal Marek <michal.lkml@markovi.net>, linux-kernel@vger.kernel.org




Masahiro Yamada (4):
  dt-bindings: fix error in 'make clean' after 'make dt_binding_check'
  dt-bindings: do not build processed-schema.yaml for 'make
    dt_binding_check'
  dt-bindings: copy process-schema-examples.yaml to process-schema.yaml
  dt-bindings: split DT schema check rules

 .gitignore                                 |  1 +
 Documentation/devicetree/bindings/Makefile | 35 ++++++++++++++++------
 Makefile                                   |  2 +-
 scripts/Makefile.build                     |  2 ++
 scripts/Makefile.lib                       | 27 +++++++++--------
 5 files changed, 44 insertions(+), 23 deletions(-)

-- 
2.25.1
