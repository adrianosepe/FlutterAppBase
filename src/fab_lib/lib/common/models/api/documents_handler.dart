import 'package:vmais/models/api/register/documents.dart';
import 'package:vmais/models/enums/edocumento_type.dart';

class DocumentsHandler {
  static bool exists(Documents docs, EDocumentType type) {
    switch (type) {
      case EDocumentType.MotoristaCnh:
        return docs.motCnh != null;

      case EDocumentType.MotoristaCompResidencia:
        return docs.motCompResidencia != null;

      case EDocumentType.CavaloCrlv:
        return docs.cavaloCrlv != null;

      case EDocumentType.Carreta1Crlv:
        return docs.carreta1Crlv != null;

      case EDocumentType.Carreta2Crlv:
        return docs.carreta2Crlv != null;

      case EDocumentType.Carreta3Crlv:
        return docs.carreta3Crlv != null;

      default:
        return false;
    }
  }

  static read(Documents docs, EDocumentType tipo) {
    switch (tipo) {
      case EDocumentType.MotoristaCnh:
        return docs.motCnh;
      case EDocumentType.MotoristaCompResidencia:
        return docs.motCompResidencia;
      case EDocumentType.CavaloCrlv:
        return docs.cavaloCrlv;
      case EDocumentType.Carreta1Crlv:
        return docs.carreta1Crlv;
      case EDocumentType.Carreta2Crlv:
        return docs.carreta2Crlv;
      case EDocumentType.Carreta3Crlv:
        return docs.carreta3Crlv;

      default:
        return null;
    }
  }

  static void write(Documents docs, EDocumentType tipo, String data) {
    switch (tipo) {
      case EDocumentType.MotoristaCnh:
        docs.motCnh = data;
        break;
      case EDocumentType.MotoristaCompResidencia:
        docs.motCompResidencia = data;
        break;
      case EDocumentType.CavaloCrlv:
        docs.cavaloCrlv = data;
        break;
      case EDocumentType.Carreta1Crlv:
        docs.carreta1Crlv = data;
        break;
      case EDocumentType.Carreta2Crlv:
        docs.carreta2Crlv = data;
        break;
      case EDocumentType.Carreta3Crlv:
        docs.carreta3Crlv = data;
        break;
    }
  }

  static String getTitulo(EDocumentType tipo) {
    switch (tipo) {
      case EDocumentType.MotoristaCnh:
        return 'Carteira Nacional de Habilitação (CNH)';
      case EDocumentType.MotoristaCompResidencia:
        return 'Comprovante de Residência';
      case EDocumentType.CavaloCrlv:
        return 'CRLV do Veículo';
      case EDocumentType.Carreta1Crlv:
        return 'CRLV da Carreta 1';
      case EDocumentType.Carreta2Crlv:
        return 'CRLV da Carreta 2';
      case EDocumentType.Carreta3Crlv:
        return 'CRLV da Carreta 3';
      default:
        return 'Não Identificado';
    }
  }

  static String getSubTitulo(EDocumentType tipo) {
    String doc;

    switch (tipo) {
      case EDocumentType.MotoristaCnh:
        doc = 'sua ${getTitulo(tipo)}';
        break;

      case EDocumentType.MotoristaCompResidencia:
        doc = 'seu ${getTitulo(tipo)}';
        break;

      default:
        doc = '${getTitulo(tipo)}';
        break;
    }

    return 'Vamos conduzi-lo através dos passos necessários para capturarmos uma imagem de $doc';
  }

  static EDocumentType getDeviceDocumentType(int deviceIndex) {
    if (deviceIndex == 1) {
      return EDocumentType.Carreta1Crlv;
    } else if (deviceIndex == 2) {
      return EDocumentType.Carreta2Crlv;
    } else if (deviceIndex == 3) {
      return EDocumentType.Carreta3Crlv;
    }

    return EDocumentType.CavaloCrlv;
  }
}
