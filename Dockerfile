FROM ubuntu:latest
MAINTAINER Ana Nelson <ana@ananelson.com>
### "from https://github.com/ananelson/scipy2015"


### "localedef"
RUN locale-gen en_US.UTF-8

### "apt-defaults"
RUN echo "APT::Get::Assume-Yes true;" >> /etc/apt/apt.conf.d/80custom ; \
    echo "APT::Get::Quiet true;" >> /etc/apt/apt.conf.d/80custom ; \
    apt-get update

### "utils"
RUN apt-get install \
      ack-grep \
      adduser \
      build-essential \
      curl \
      git \
      man-db \
      pkg-config \
      rsync \
      strace \
      sudo \
      tree \
      unzip \
      vim \
      wget \
    ;

### "python"
RUN apt-get install \
      python-dev \
      python-pip \
    ;



### "matplotlib"
RUN apt-get install \
        libfreetype6-dev \
        libpng-dev \
    ; \
    pip install matplotlib
RUN pip install astropy



### "scipy"
RUN apt-get install -y python-numpy
RUN apt-get install -y python-scipy
RUN apt-get install -y ipython
RUN apt-get install -y ipython-notebook
RUN apt-get install -y python-nose
RUN apt-get install -y python-astropy

### "texlive"
RUN apt-get install --no-install-recommends \
      texlive-latex-base \
      texlive-latex-extra \
      texlive-latex-recommended \
      texlive-pstricks \
      latexmk

### pythontex
RUN apt-get install -y python-pygments
RUN git clone https://github.com/manuelmarcano22/pythontex.git && \
    cd pythontex/pythontex && \
    python pythontex_install.py 
RUN cp /usr/share/texlive/texmf-dist/scripts/pythontex/* /usr/bin/ && chmod +x /usr/bin/pythontex*


RUN apt-get -qq update && apt-get install -y \
	dbus \
	evince \
	--no-install-recommends \
	&& rm -rf /var/lib/apt/lists/*


### "create-user"
RUN useradd -m repro && \
    echo "repro:password" | chpasswd ; \
    echo "repro ALL=(ALL) NOPASSWD:ALL" > /etc/sudoers.d/repro

### "activate-user"
ENV HOME /home/repro
USER repro
WORKDIR /home/repro/work

ADD documents documents
#ADD pythontex pythontex
